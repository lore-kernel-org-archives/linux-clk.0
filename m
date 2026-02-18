Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C31302140
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413859; cv=none; b=PdtQvWy8c6Ix4JWOBGnmnoBxm6JYkKUdzuAYmR+bTGK7V4ZSZ2YmodVT412HmNAGXlTwd442QDn6quOoauVDMsaOFBF+l9Eui2aDaWuUfH9yWH7Ye3o89MqVkJVB/1CXsM8eAvvOBLOAAmiz0gjejuDnKfm+9ebMa3yQdIZwOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413859; c=relaxed/simple;
	bh=WL16A14IHJFls09t6846X750Ko4v7i2RpOSf0P0jIxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=FXQloxd8CfK4S5mclsv7jSqJXdj7rbq225eE5u8ZTcuIL9h/ixLMS1y9+MD9Zw8D7OKYgBYYbXKPqmQXqUaES0V0eVoXe1F9wrCYU302pkosdS+8jDENW5ZmgCnTBE7s9sVVF9yuIQL/QrMd56AmmHKoR9eJkUEoF5O0og+dB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RaPraqdE; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RaPraqdE"
Date: Wed, 18 Feb 2026 11:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771413854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BEknqRay9cLst5+GJTiimtPKgqbaOAo4KgPgHKVMPt8=;
	b=RaPraqdEBp6UPnaqoDyevHruMq95QSv53angpGggoOK+NLRbpW/jmUnTZ1bK91Uetwzwlv
	8ZEgDt1wq7CPBSLFiujoBN5uhZcKE5+LMq9pw2Oul5AotTuv8vNh2c3GYNtEXWu01BuLuJ
	osYkb6S0f+Cv/agd6nNDDdJda4KLgZ5YeJLJHOf6YeZHnvKyF4Kpr6dyx3FBaj3G19Y89f
	gJPfywKJGtCujFS0TrBHv2L4FqSReG5k/Z647wGZvZiOFDpLmNRyM1XLPb1CNm4DQ+2BYh
	Jn94sPZblRRGSdUYUNAPWPuKP3vZn5us5B0QqazGPL3mT+o53wnPDCff56QVyA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll support
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr> <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
In-Reply-To: <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
Message-ID: <tanjoa.3m1sr95zhvsal@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi,

On Wed, 18 Feb 2026 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Your commit description is almost the same on every patch in the series.
Probably having a more specific description per commit would be much more
useful, for reviewers to better understand your commit.

There are documentation pages on how to write informative commit messages
at [1] and [2], but in summary, your description should talk about *what*
is being done and (provided that makes sense), *why*.

You also have multiple commits with the exact same commit message
("dt-bindings: clk: meson: Add Amlogic T7 sys pll support"), did you
mean to squash them all into one? (You can do so with `git rebase -i`.)

It probably also would make sense to add a cover letter, which would describe
overall what you goal is with this patch series, and on a high level
(doesn't have to be too detailled, because you'd describe these in more
detail in the respective commit messages themselves) what each patch does.
This once again helps people reviewing your code to understand what problem
you're trying to solve.

[1]: https://docs.kernel.org/process/submitting-patches.html#explanation-body
[2]: https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Best regards,
Ferass

[PS: sorry if this email was sent twice, my email client did something
     strange]

>
>Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>---
> include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>index 32c4b62037de..0cda8edfa7cd 100644
>--- a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>@@ -224,5 +224,12 @@
> #define CLKID_SYS_PWM_AO_CD		215
> #define CLKID_SYS_PWM_AO_EF		216
> #define CLKID_SYS_PWM_AO_GH		217
>+#define CLKID_SYS_A_SEL			218
>+#define CLKID_SYS_A_DIV			219
>+#define CLKID_SYS_A			220
>+#define CLKID_SYS_B_SEL			221
>+#define CLKID_SYS_B_DIV			222
>+#define CLKID_SYS_B			223
>+#define CLKID_SYS			224
> 
> #endif /* __T7_PERIPHERALS_CLKC_H */
>-- 
>2.49.0
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic
