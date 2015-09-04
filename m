Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <1441349872-4560-7-git-send-email-bhupesh.sharma@freescale.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
 <1441349872-4560-7-git-send-email-bhupesh.sharma@freescale.com>
Date: Fri, 4 Sep 2015 15:01:55 -0500
Message-ID: <CADRPPNQsemXa2HgYZAcm+GurhimHbYVM5CL5ReDsyuzfAO=kSQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] clk: qoriq: Add ls2080a support.
From: Li Yang <leoli@freescale.com>
To: Bhupesh Sharma <bhupesh.sharma@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 marc.zyngier@arm.com, Catalin.Marinas@arm.com, will.deacon@arm.com,
 olof@lixom.net, Scott Wood <scottwood@freescale.com>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 4, 2015 at 1:57 AM, Bhupesh Sharma
<bhupesh.sharma@freescale.com> wrote:
> From: Scott Wood <scottwood@freescale.com>
>
> LS2080A is the first implementation of the chassis 3 clockgen, which
> has a different register layout than previous chips.  It is also little
> endian, unlike previous chips.
>
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---

You should probably mention here that the patch is depending on
another pending patch to apply.  And this patch should be going
through the same sub-system tree as the dependency patch.  Otherwise,
there is no way it can be applied.

Regards,
Leo

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
