Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01E393DC1;
	Tue,  2 Jun 2026 05:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780379214; cv=none; b=H5PeMPq25+ypvgwI0DjLyxFUcuBPzGeioY1vhaNM7/L24dDLREhQmLnjCSW2B0e5d4cxMA0aoqxFvzITQrnPO2pBOG2RaA07Teyk8VgZ9JxgXHOCf/GEurC4Z9QWUS0BhhH1qjdtxXtCKHYynBBaXvH6zIQWkBmzc3IywhHDy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780379214; c=relaxed/simple;
	bh=WTlnb6WhBew/Lr7lTzYI38c13gwnVdQUjWbEmQwh1Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KwCIn676HvJ/HZ1/uLaqUIjX1VaJIo3DCdOAah84IYeZ/AHkB6epZq2UZAlMz04tsTEWmsXCAmvctCh4wlDogOIieljVkz4qkcw/JdNxGDWLYH4LZYxspJikEohd7XIqakhRWAoo9P8DB+nGisjiAbjS8szpuknMreLpPP17qsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=Uu9xj1Wu; arc=none smtp.client-ip=149.210.149.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="Uu9xj1Wu"
Received: from submission8.mail.transip.nl (unknown [10.103.8.159])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4gV0Fc3LW8zxP7H;
	Tue,  2 Jun 2026 07:46:44 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission8.mail.transip.nl (Postfix) with ESMTPA id 4gV0Fb5wrGz3RgQXq;
	Tue,  2 Jun 2026 07:46:43 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8660: register PLL4_VOTE for LPASS
Date: Tue,  2 Jun 2026 07:46:43 +0200
Message-ID: <20260602054643.452049-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602042747.277270-3-github.com@herrie.org>
References: <20260602042747.277270-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission8.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780379204; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=XjBv83Sj8FKAhDYVPn4VOY/phqktLX+/RqBuAjWHddY=;
 b=Uu9xj1WuBIhW0ITKJ7VBcHA+hBrhHIW5bBuRjq2MrCn7MIqXRySHoTNVNmsUvZsYuMjDJ7
 0vBOfzEx4heodOtWd2XYZt+W1h/rMhbQFZA2zk9bNw5qWIs1AiQH23jIkGvT0eciHXvT8s
 AWUmMDF1WryL0Mh93VAQt2CAkHKok1zDFodInjK+kxzI9y2EnvJPYo04DWsHxEAEW/UmkE
 a61YoK+wfhkM3tiC0YrZuqdWq7FEUQtV1kupXv8nRxjUfub2Ja4gxVlD/wH2o4sY9E1QBb
 UQh2oVGR3ec1tdWyCZnnVK0G9bX97tUPuLdWWyK0F1YY8p1kt3PSe8obFl+zUA==
X-Report-Abuse-To: abuse@transip.nl

Hi,

Thanks, two real items here. Triage:

[High] clk_pll_vote_enable() NULL deref on orphan parent.

Confirmed: clk_hw_get_parent() can return NULL while the LCC parent
is not yet bound, to_clk_pll(NULL) is then handed to wait_for_pll(),
and clk_hw_get_name(&pll->clkr.hw) reverses the offset back to NULL
and panics in core/core->name.

Not introduced by this patch though: drivers/clk/qcom/gcc-msm8960.c
and gcc-apq8064.c already register an identical pll4_vote with the
same parent_data fw_name = "pll4" and clk_pll_vote_ops, and have for
years. The hazard already lives in mainline; my patch is a clone of
the same pattern for the older Scorpion-class MSM8x60 family.

I will send a separate one-liner fix to drivers/clk/qcom/clk-pll.c
adding the NULL check in clk_pll_vote_enable() so the cross-driver
voter pattern stops being a latent panic everywhere it is used.
That patch is a precondition for v2 of this series. I would rather
not invent a parallel non-vote ops for MSM8660 specifically when
the right answer is to make the existing one safe.

[Medium] qcom,gcc-msm8660.yaml does not allow "pll4" in clock-names.

Real, and an oversight on my part. The qcom,gcc-apq8064.yaml schema
already documents the same shape -- clocks maxItems = 3, third entry
"pll4" -- because apq8064's gcc-apq8064.c has the same pll4_vote
pattern. I will mirror that here in v2:

  -  clocks:
  -    maxItems: 2
  -  clock-names:
  -    items:
  -      - const: pxo
  -      - const: cxo
  +  clocks:
  +    minItems: 2
  +    maxItems: 3
  +  clock-names:
  +    minItems: 2
  +    items:
  +      - const: pxo
  +      - const: cxo
  +      - const: pll4

The yaml fix becomes a new PATCH 1/3 in v2 (ahead of the existing
CE2 + PLL4_VOTE driver patches) so the schema lands before the
consumer.

I will hold v2 of this series until both the clk-pll.c NULL-check
fix has had review traction and any further feedback on the v1
patches has come in.

Thanks,
Herman
