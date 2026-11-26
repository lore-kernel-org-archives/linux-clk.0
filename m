Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655357;
	b=T7AxiWiMwKGgG2LQcrOkK8wf0ooPF+0NzTaec2f2n6Ta9zJo91Wi1lj96IAN9kJKgPqM
	 +A72w571gxt2hFixMP/fI0M2+/xWaKiaxrTt7M2D67IwcxdDQM14A+7IFCCA0+p13hGfg
	 PttfCDJPmb/zVHaspT/j160tEZiI30W0mAe2fg2vNN1KLygQQYRErtxaIk5crSrX5TPn0
	 Q/euIQNrCEPtF817Fnigm8pKybd3ifOrOzdv2bsdf8k/LmPEsrAf6etCRFGOqI/SWQWu9
	 tM94uZwh+SkSD4rAwjkno1fmLRjJZ5bEknmLmLvsJqYjzl5WqMQ6hRJaqglzBxftqWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655357;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=cVZCQS/sAiVsiL05n511eoHB+ur+m2IPgrOc1YWdYcc=;
	b=mPioAh2YZPR4gBIoRCNrwYvgaGPfefZP6MGKaSlxLt++rlTetI/wiAV7Ec29FpJFkQe8
	 f9cPsQ52je1S81vXoH12VZ08uIp6EEn1/QJqtiFRjZGoF06H4H0u8fdlMaoNJAAvUOccZ
	 JK+coh6i+1oasE/CKxwyyRGOF0xNeoVdZ3T7311dzDRADJAirvEJySubV1+E/BgSg+0wh
	 tyKI0lJFOJgljqzTuoKhIw0dl6tnJIriS000EA4hR81O1J0DR3rZ33dG0EMgzeC9fpfeB
	 vvVgoQIrjwwb18t/IQXz2VI0XV7jIiaW+9RtTBBA/eM5tu1JYJ7tlFXeVkuBi8iwo9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M/dGdlwo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB46070BBE;
	Thu, 26 Nov 2026 01:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/dGdlwo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4F41F01565;
	Thu, 26 Nov 2026 01:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795655356;
	bh=cVZCQS/sAiVsiL05n511eoHB+ur+m2IPgrOc1YWdYcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M/dGdlwobXAE77EcYDesM+vVZmuAa57R+0n2LOOCMuXgRfZd4YiOEAYjlLYGftKFm
	 8y/UceQUlPIAisK/TJXQrPQ4dPC0oCcoWRklaKqckUOte+ANqxiny7KKQhvPr4gZ7Z
	 1i+HRqSMoJ4d8DpOaEBIIzwZ5PcSJUeXZN6BaHJ0/3C1Pii6MXbSfVCTzgb64YJQnn
	 2AH1V6t0qJBTEmNV1aCiUSsg9NOTfL5+U3kYw8eCav7jeidItN4Beajn5zgzKCJgLo
	 R5pOJhcGe0QlBQXhoSU6YWrCPljWH1GCrOIvUz0Xh58YI6WTZA2VeL/jQKlETfYyei
	 lV3RG4rUAYNBA==
Date: Thu, 26 Nov 2026 01:09:14 +0000
From: Yixun Lan <dlan@kernel.org>
To: =?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yao Zi <me@ziyao.cc>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Message-ID: <20261126010914-GKN100890@kernel.org>
References: <20261117205951.140146-3-frederic.mahe@cirad.fr>
 <20261118111528-GKD156369@kernel.org>
 <20261118171536.197538-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118171536.197538-1-frederic.mahe@cirad.fr>

Hi Frédéric,

On 18:15 Wed 18 Nov     , Frédéric Mahé wrote:
> Hi Yixun,
> 
> Thanks for forwarding it to SpacemiT.
> 
> On Wed, Nov 18, 2026 at 11:15:28AM +0000, Yixun Lan wrote:
> > Access which register? is the PWM register in RCPU2?
> 
> No, the hang comes before any PWM register access. The PWM probe
> first deasserts the reset and enables the clock, both in
> RCPU2_PWM2_CLK_RST (0xc0888008, in the syscon_rcpu2 range), and that
> access hangs. The PWM registers (0xc0888300) are never reached. I
> have not tested each register on its own (every hang needs a power
> cycle), but I can do it if that helps.
> 
> > It just happen to fix the issue, but doesn't sound like a correct fix,
> > usually, it can be fixed with correct clock topology
> 
> Agreed. The vendor kernel never gates this clock either
> (CLK_IGNORE_UNUSED in ccu-spacemit-k1x.c). If pll1_aud_245p7 is the
> bus clock of the RCPU2 block, it could become a clock of the
> syscon_rcpu2 node, and the CCU driver would enable it before its
> first register access. I will wait for SpacemiT's answer before v2.
> 

Yes, Vendor confirm pll1_aud_245p7 is bus clock for RCPU2 block,
Agree to explicitly request the clock in syscon_rcpu2, something

     syscon_rcpu2: system-controller@c0888000 {
         compatible = "spacemit,k1-syscon-rcpu2";
         reg = <0x0 0xc0888000 0x0 0x28>;
         clocks = <&pll CLK_PLL1_D10_AUD>;
	 clock-names = "bus";
         #reset-cells = <1>;
     };

 - reset-spacemit-common.c:
       clk = devm_clk_get_optional_enabled(dev, "bus");
       if (IS_ERR(clk))
               return dev_err_probe(dev, PTR_ERR(clk),
                                    "failed to enable bus clock\n");

-- 
Yixun Lan (dlan)
