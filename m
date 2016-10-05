Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] Renesas R8A7743 CPG/MSSR clock support
Date: Wed, 05 Oct 2016 23:50:32 +0300
Message-ID: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hello.

   Here's the set of 3 patches against the 'clk-next' branch of CLK group's
'linux.git' repo. The R8A7743 SoC support will be posted separately later --
this series depend on the Kconfig variable introduced there, however, the DTs
in that series will depend on the patch #2 of this series...

[1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support
[2/3] ARM: shmobile: r8a7743: add CPG clock index macros
[3/3] clk: renesas: cpg-mssr: add R8A7743 support

MBR, Sergei
