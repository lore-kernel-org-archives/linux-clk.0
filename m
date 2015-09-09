Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Message-ID: <1441816797.29081.9.camel@freescale.com>
Subject: Re: [PATCH v2 06/10] clk: qoriq: Add ls2080a support.
From: Scott Wood <scottwood@freescale.com>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Date: Wed, 9 Sep 2015 11:39:57 -0500
In-Reply-To: <1441349872-4560-7-git-send-email-bhupesh.sharma@freescale.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
 <1441349872-4560-7-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, arnd@arndb.de, marc.zyngier@arm.com,
 Catalin.Marinas@arm.com, will.deacon@arm.com, olof@lixom.net,
 bhupesh.linux@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2015-09-04 at 12:27 +0530, Bhupesh Sharma wrote:
> From: Scott Wood <scottwood@freescale.com>
> 
> LS2080A is the first implementation of the chassis 3 clockgen, which
> has a different register layout than previous chips.  It is also little
> endian, unlike previous chips.
> 
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---

You should add your own signoff when passing on someone else's patch.

FWIW, I'm likely to squash this with my previous clk-qoriq patches when I 
resubmit.

-Scott


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
