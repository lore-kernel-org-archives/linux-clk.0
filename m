Return-Path: <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/6] ARM: dts: sun8i: add a cpu0 label to cpu@0 node on
 A23/33
To: Icenowy Zheng <icenowy@aosc.xyz>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-4-icenowy@aosc.xyz>
Cc: Russell King <linux@armlinux.org.uk>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Jorik Jonker <jorik@kippendief.biz>,
 Hans de Goede <hdegoede@redhat.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <139af71f-390a-4023-8f82-71dd80212518@arm.com>
Date: Tue, 13 Dec 2016 16:09:59 +0000
MIME-Version: 1.0
In-Reply-To: <20161213152252.53749-4-icenowy@aosc.xyz>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 13/12/16 15:22, Icenowy Zheng wrote:
> A "cpu0" label is needed on cpu@0 for cpufreq-dt to work.
> 

IIUC any label should be fine and I don't see anything in the driver
looking for such label name. All I see is it looks for cpu0 regulator
for *legacy* DTs

> Add such a label, in order to prepare for cpufreq support of A23/33.
> 

You need this as you add the same label in the following patches. The
commit message sounds like cpufreq-dt search for that label by name.

-- 
Regards,
Sudeep
