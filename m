Return-Path: <tedheadster@gmail.com>
MIME-Version: 1.0
Reply-To: whiteheadm@acm.org
From: tedheadster <tedheadster@gmail.com>
Date: Tue, 13 Mar 2018 07:20:19 -0400
Message-ID: <CAP8WD_ZUbO+aKUV1-tPS_5APkpSAwbi=K=koVEDWWUfzF0tW+A@mail.gmail.com>
Subject: x86 : Kconfig : INTEL_PMC_CORE not specific enough
To: linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, rajneesh.bhardwaj@intel.com,
	vishwanath.somayaji@intel.com, irina.tirdea@intel.com
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Intel PMC Core and CLK API teams,
  I am trying to build a minimal kernel config on old
regression-testing hardware. Presently there is the following
drivers/platform/x86/Kconfig item:

config PMC_ATOM
       def_bool y
       depends on PCI
       select COMMON_CLK

This creates a cascade of Kconfig "select" statements and pulls in two files:

drivers/clk/x86/clk-pmc-atom.c
drivers/platform/x86/intel_pmc_core.c

The Kconfig seems too general to me. Compiling for my i586 Pentium-I
pulls in these files (I think) unnecessarily. Why does _anybody_ with
a PCI bus need these ATOM-specific files?

Would this change (or something similar) make sense?

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d10ffe5..6a026fa 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1217,5 +1217,5 @@ endif # X86_PLATFORM_DEVICES

 config PMC_ATOM
        def_bool y
-       depends on PCI
+       depends on PCI && MATOM
        select COMMON_CLK
-- 
1.8.3.1

- Matthew Whitehead
