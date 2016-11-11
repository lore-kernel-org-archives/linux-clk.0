Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Bastian =?ISO-8859-1?Q?K=F6cher?= <mail@kchr.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [clk:clk-qcom-8994 2/2] include/linux/module.h:213:1: error:
 expected ',' or '; ' before 'extern'
Date: Fri, 11 Nov 2016 08:35:13 +0100
Message-ID: <19999499.Yz2FylxFTS@bastiultrabook>
In-Reply-To: <20161110234515.GO16026@codeaurora.org>
References: <201611110732.1ceuZvsr%fengguang.wu@intel.com>
 <20161110234515.GO16026@codeaurora.org>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: kbuild test robot <fengguang.wu@intel.com>,
 Jeremy McNicoll <jeremymc@redhat.com>, kbuild-all@01.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Thanks for doing that :)

On Donnerstag, 10. November 2016 15:45:15 CET Stephen Boyd wrote:
> On 11/11, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-qcom-8994
> > head:   cc800227108710c8f02255e61659b956b041eec3
> > commit: cc800227108710c8f02255e61659b956b041eec3 [2/2] clk: qcom: Add support for msm8994 global clock controller
> > config: i386-allmodconfig (attached as .config)
> > compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> > reproduce:
> >         git checkout cc800227108710c8f02255e61659b956b041eec3
> >         # save the attached .config to linux build tree
> >         make ARCH=i386 
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> >    In file included from drivers/clk/qcom/gcc-msm8994.c:20:0:
> > >> include/linux/module.h:213:1: error: expected ',' or ';' before 'extern'
> >     extern const typeof(name) __mod_##type##__##name##_device_table  \
> >     ^
> > >> drivers/clk/qcom/gcc-msm8994.c:2265:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
> >     MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
> 
> Urgh that's sad. Too bad MODULE_DEVICE_TABLE doesn't have
> something in it in the !MODULE case to cause compilation problems
> like this to come out. I'll go fix this up.
> 
> 



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
