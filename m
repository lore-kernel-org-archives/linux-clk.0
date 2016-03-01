Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 1 Mar 2016 18:59:35 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3 2/5] ARM: OMAP2+: DRA7: Add hwmod entries for PWMSS
In-Reply-To: <20160301181109.GB13417@atomide.com>
Message-ID: <alpine.DEB.2.02.1603011858510.14948@utopia.booyaka.com>
References: <1456439796-28546-1-git-send-email-fcooper@ti.com>
 <1456439796-28546-3-git-send-email-fcooper@ti.com>
 <20160301181109.GB13417@atomide.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, Franklin S Cooper Jr <fcooper@ti.com>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 1 Mar 2016, Tony Lindgren wrote:

> * Franklin S Cooper Jr <fcooper@ti.com> [160225 14:37]:
> > From: Vignesh R <vigneshr@ti.com>
> > 
> > Add hwmod entries for the PWMSS on DRA7.
> > 
> > Set l4_root_clk_div as the main_clk of PWMSS. It is fixed-factored clock
> > equal to L4PER2_L3_GICLK/2(l3_iclk_div/2).
> > As per AM57x TRM SPRUHZ6[1], October 2014, Section 29.1.3 Table 29-4,
> > clock source to PWMSS is L4PER2_L3_GICLK. But it is actually
> > L4PER2_L3_GICLK/2. The TRM does not show the division by 2.
> > 
> > [1] www.ti.com/lit/ug/spruhz6/spruhz6.pdf
> 
> Looks OK to me, assuming Paul will pick this one or ack it.

Well I've already sent comments on it, it doesn't look quite ready for me 
yet.  I would hold off on the whole series because the hwmod comments also 
impact the DT files.

- Paul

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
