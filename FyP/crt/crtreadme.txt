================================================================================
  Crt Unit Read-Me

  By: Will DeWitt Jr. (edge@boink.net)
    Mar 21st, 2003
================================================================================

  BRIEF NOTES AND INFORMATION:

  This unit was created primarily to support my development of console mode
applications under Delphi.  I've tested this unit and had it successfully works
under Delphi 2, 3, 4, 5, 6 and 7.

  I've also extended the Crt unit in a lot of places, adding in functionality
that one may need under Win32 (since direct screen writes don't really exist,
for example, and you may want to display raw 'special' characters such as #13).
As well, you may find it useful to read the documentation I've included, which
is in HTML Help format and based heavily off of the original Turbo Pascal
documentation (I made the help format match that of the Platform SDK help,
since I like the straight-forward and easy to follow format Microsoft used for
their help).

  This unit was based heavily off of the Borland CBuilder 5 RTL.  I attempted to
contact someone at Borland to receive permission to distribute this, and having
received no reply almost 3 months later, I'm going to submit this to CodeCentral
and hope that either a) Borland is okay with Delphi users having a Crt unit or
b) I've modified the code I based this unit off of enough that there's no issue
of copyright violation.  The other reason I based it off of the BCB 5 RTL was
to maintain exact functionality between conio in BCB and Crt in Delphi.

  In any event, this unit will be useful for those of you trying to integrate
GUI and console elements, and is much more functional than any Crt replacement
I've seen for Delphi.  Features that this unit has that other (even commercial!)
units do not--

  * Support for the legacy Window function, including proper output during
    calls to Write and WriteLn.
  * Support for AssignCrt, including the ability to create a console in a 
    VCL/GUI application at run-time (use AllocConsole, then follow that up with
    AssignCrt and you're pretty much set-- see documentation for details).

  This may also be useful for people who want to develop new console 
applications under Win32 (afterall, Delphi 5 and above supports the creation
of 'Console Application's via the 'New...' File menu item, and for small utility
apps, this makes more sense than a full blown GUI).  In any event, I hope you
find it useful.  =)

  CONSOLE APPLICATIONS

  In Delphi 5 and above you can create console applications quickly and easily
by simply choosing 'Console Application' from the 'New' project menu item off
of the 'File' menu (or in D7, scroll down to 'Other' off of the 'New' menu
item).  In prior versions, it takes a little more work, but is still quite
easy.  All you need to do is create a new blank project, then remove the
default TForm1 that is added.  This should leave your project with only the
project source (the *.dpr file).  Remove the reference to the 'Forms' unit,
and then remove the code between 'begin' and 'end.'.  At the top of your
project source (above the 'program <project name>' add)--

{$APPTYPE CONSOLE}

Then add 'Crt' to the uses clause, and insert your code between the now empty 
'begin' and 'end.'.  This is how you should be used to development if you ever
used Turbo Pascal or Borland Pascal.  =)  Once you compile your project, you
can try to run it from the IDE.  If you left it at a blank project, you should
observe a console window appear and disappear quite quickly.  If you add the
following code between the 'begin' and 'end.'--

TextColor(10);
WriteLn('This is some lime green text.  <press enter to quit!>');
ReadLn;

You should see some bright green/lime green text appear in a console, then be
able to press enter to dismiss the application.  This is your basic console
application quick and dirty tutorial.  Not a lot, but hopefully it's enough
to help anyone still interested in console mode development.

  DELPHI CRT UNIT RELEASE NOTES

  Delphi Crt unit 1.00 to 1.10 changes

  1) Added compatibility with Delphi 2, pretty sure the changes made will also
     make the unit work with Delphi 3 (untested, however).  This was made more
     difficult by the bugs in Delphi 2's Windows.pas unit.
  2) Added a HighIntensity constant which has the exact same value as Blink,
     but is not marked as 'deprecated'.

  Delphi Crt unit 1.10 to 1.11 changes

  1) crt_D7.pas is a Delphi 7 version of the same Crt unit, the only difference
     is that it lacks all of the conditional defines that makes it compatible
     with earlier versions of Delphi (2-6).  If you use the latest and greatest,
     or work for Borland and want to include this unit with a new version of
     Delphi, simply rename crt_D7.pas to crt.pas and use it instead of the 
     conditional defines version of crt.pas.
  2) Did away with some conditional defines by defining a 'longword' type that
     merely equates to 'longint' for older platforms (this is controlled via an
     $IFDEF and not included if a real 'longword' is available).
  3) Fixed some comments in the code that got moved off when I was doing the
     legacy Delphi updating in 1.10.

  Delphi Crt unit 1.11 to 1.12 changes

  1) Fixed an issue with my declaration of 'longword = longint' for older Delphi
     versions.  It was a last-minute change that went untested, and I forgot to
     include a 'type' keyword prior to the type declaration.  =)  Thanks to 
     Mark Vaughan (mavaughan@[RemoveThis!]earthlink.net) for noticing this.
  2) Fixed an issue involving the version detection done via crt.inc.  I somehow
     missed the fact that there was no Delphi compiler released with VER110, and
     that Delphi 3 (VER100) went to Delphi 4 (VER120), with VER110 being used on
     a release of CBuilder.  Thanks again to Mark Vaughan for noticing this 
     issue (which I've corrected as of this release).

  Delphi Crt unit 1.12 to 1.20 changes

  1) Fixed a number of grammar and spelling issues in the Crt documentation.
  2) Added some additional extended Crt functionality, including the ability to
     save the screen contents and restore them, as well as save the entire Crt
     state for later restoration.
  3) Fixed an issue in SetCursorType which seemed to result in the cursor not
     being correctly hidden.
  4) Added callback functionality for console events, you can now install your
     own event handler to process the various CTRL_xxxx events Windows generates
     in response to user interfaction (i.e. - user presses Ctrl+Break, Windows
     generates a CTRL_BREAK_EVENT event, user presses the close (X) button,
     Windows generates a CTRL_CLOSE_EVENT event, etc).

  CONTACT INFORMATION

  Please address questions, comments, suggestions or job offers to 
edge@boink.net.

================================================================================

