Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au
Subject: [PATCH v2 0/2] Renesas R8A7743 CPG/MSSR clock support
Date: Fri, 07 Oct 2016 23:45:23 +0300
Message-ID: <9246696.7P1aOyyQt4@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hello.

   Here's the set of 2 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. I'm splitting this from the R-Car gen2 common support patch.
As the DT patches in the R8A7743/SK-RZG1M board support series depend on the
patch #2 of this series, so it might make sense to merge this patch to the
'renesas.git' repo as well...

[1/2] ARM: shmobile: r8a7743: add CPG clock index macros
[2/2] clk: renesas: cpg-mssr: add R8A7743 support

MBR, Sergei
