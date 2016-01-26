Return-Path: <linux-kernel-owner@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH] clk: rockchip: Reparent hclk_rom, hclk_i2s0 and hclk_spdif to hclk_cpubus on RK3066/RK3188
From: Alexander Kochetkov <al.kochet@gmail.com>
In-Reply-To: <18195479.b78tX8z5U3@diego>
Date: Tue, 26 Jan 2016 16:16:57 +0300
Cc: stable@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <0F6CFF20-C3D2-4A4D-83D5-1DE6014BB75D@gmail.com>
References: <1453812250-11819-1-git-send-email-al.kochet@gmail.com> <18195479.b78tX8z5U3@diego>
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


> 26 янв. 2016 г., в 16:04, Heiko Stübner <heiko@sntech.de> написал(а):
> 
> Can you instead try to add hclk_cpubus to the critical clock list please?

Yes, adding hclk_cpubus to rk3188_critical_clocks also fixes problem.
So, I’ll send another patch now.

Thank, you.
