Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E22239E80;
	Tue, 21 Jul 2026 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637457; cv=none; b=uOWQrWY0Cq1MSFWzR7zMHihbyX8KcPevwWunukRR5PsZ9e/qcJGH81e4CEawsW/+XKMLxlYbiMhUyDIIfASEG9i9PbD+stguMHC7wuEfTekYUJKyqirV78ZPKLcy1nlcnJQyTQcnF3X7c5vZZ/A/8Rm479ZyFmTTYpXjwiLGq5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637457; c=relaxed/simple;
	bh=qhnwwtEuhXcxYk0MypyGlFNJANPxkQlnhPsNlITEluU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=YKTmuQCQqshizPUKhUG4vYAbFOHjvRmJVdnw/Gez8Q7NBF4A+vRnWFJAJss7UqW8VhPUlRxzLHSXQsP65K89ZHIbWX/Q2BPs/ph/b4s7GWI00DU96BLdhUmqgVBHK8hlc9HX2QQSVUytUhRyUXUqcLEa9GBOGOJUbBFfBhvsv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TOoSss+v; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TOoSss+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784637437;
	bh=P6/1sr4qvixoiNkBTsBAYtxWyovt0dZLYXNq2QiK1qc=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=TOoSss+vACADodypSEDUPuJVWCmUyvRPI8PJkLWycWiTFxFHbHvv5Km/ArMArSk8w
	 5J56bZBQOduKmM15G0aC64GfLymIM43mIOyI23gelQTj1D9BCAwhJiJxKdWKVl1GtC
	 uaoq4GOyOZX4aldF1VnXXsROsLB06eHFo97vxCAA=
X-QQ-mid: esmtpgz11t1784637435t47ac860c
X-QQ-Originating-IP: tntK1MQ1IUOg67b1uF/vVh5yYOC+UElvBpzgzBVoRVA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 20:37:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4120638745816220918
EX-QQ-RecipientCnt: 15
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 05:37:12 -0700
Message-Id: <DK4966E0B5GS.3FTMQR43Z9LA8@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s
 sysclk dividers
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20260717073701.94A511F000E9@smtp.kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
	<20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
	<20260717073701.94A511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OE2SNMSfMbmOdjH/0KOsMDPqWwXp1+qMmNWDQNk3sY3D++KK0Iu5FPHn
	M7QNTt2ei+mSiqmVHJmiodWFJpJxuJp9Nl/gBQ6iUAEOau6z9RiTNTX+9yMzJdhgfK/t4vs
	FqPCR6q1DM7jdIR/G7U6KLOsJls5GnIcQzWAAforJWl6GLVubDc4xs6T+DpfEONMiBabwFQ
	bbpRSnhhyeQ1bJbkkPPYR1wwIkJz2JHmqOoWFO1MYi62Tz57bxmCutAS6FV3h/qAtf9Urbz
	p8TdzXAE917ONn0fML62vNKHd8NhSAYeGeE7WxRhCVdN+lcwcYPuvUdwe2GAyBCyHWMuP2M
	QvGys04h8gYncwPKwff1oSuk/MtBOxrKtEnxVLyOK3Dg1XfgyQqsOp3wwS/ec0AwqcOFbul
	FRpx3RsPlTG6OKHvL84uuy7sl2oLMqmNs3uTldALUVuAquqZRrG0+XEmmqHu2Tr/zdjQ+VC
	0mZRVYdL/gViZylwcUWFrb0LLh99XLLuBUxYAc2oDsR2KQS/0ZJvsBq0viI1U122iwVKpX9
	8Ya4dEjp4K3sFCewLjOk+x+JU5CXR639EiY/IR+TUXWjab5ynk+3bZLXE/WDuDTMbIQjYCD
	sSd4TK0XDVcbnYUTo4Fvsnhl8fAQu0F2m2MsGZPDQYSM1I+mizZ9tMOe9bqNDjxIPAE4HzS
	X2DjXjzyPoMosTD8CKP4atkejkWqxr91SWuThWbPCEc5BXZxjkzqc+SYPMZfNhCubE08CZe
	Qbg49vUFllo523vVAOJPwPWfZvZ+rWjs6jlGAsxiC90OIDvoAoSKm9drcP/VGCsF2HSR4Ss
	A4m9631Uv1XXxTzvbogflgAZuoqOhvvxg88uXquTtEGMLqo2Ps1Ft+Zo0xuE8RE/x5xASeg
	nUboV1zMZIOosMCaxpYcUd4TuagEWlSVgjX7ZQi2Xd/OuYX0NyTbfrBU4M5lmu+X5ud+xRm
	8JiIX0JND7NXAp+mPXe75UoC8EmHTrJIRd5b1i1xT+BQOIJun7v8WgVTgEGfVHfA6kawB9q
	eUwuc3F47Dhf/lOZ4U3VKBilczvnHWAkdndh/oIFRURvFA0u0otnkaqw5RLgwVf+BpiAYr0
	PBqnVVjyrAB
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

> The i2s{0,2,3,4,5}_sysclk_div DDNs have an additional fixed 1/2
> divider in the hardware IP after the configurable divider, so the
> real output rate is:
>
>     rate = parent_rate * num / (den * 2)
>
> [Severity: Medium]
> Does this formula mathematically contradict the driver's implementation?
>
> The code in drivers/clk/spacemit/ccu_ddn.c calculates the rate by
> multiplying by den and dividing by num:
>
>     return prate * den / pre_div / num;
>
> Could the commit message be updated to reflect the actual hardware behavior?

Good catch. The formula in the commit message has num and den reversed. The
correct formula is:

    rate = parent_rate * den / (num * 2)

I will correct the commit message in the next revision. The pre_div = 2
change itself remains correct.

> [...]
>
> [Severity: High]
> This is a pre-existing issue, but can this lead to a kernel panic due to an
> unhandled zero divisor?
>
> In drivers/clk/spacemit/ccu_ddn.c, ccu_ddn_recalc_rate() reads hardware
> registers directly:
>
>     num = (val & ddn->num_mask) >> ddn->num_shift;
>     den = (val & ddn->den_mask) >> ddn->den_shift;
>
>     return ccu_ddn_calc_rate(prate, num, den, ddn->pre_div);
>
> If the register contains 0 for num, ccu_ddn_calc_rate() will divide by zero.
> Additionally, ccu_ddn_calc_best_rate() can pass num = 0 when
> prate / ddn->pre_div evaluates to 0.
>
> Should we add validation to prevent division by zero in these paths?

Yes, these paths should guard against a zero divisor. This issue predates
the K3 I2S change and is independent of the fixed-divider correction, so I
will address it in a separate ccu_ddn patch rather than expanding the scope
of this series.

                                            - Troy
