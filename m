Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908662571DA;
	Tue,  2 Jun 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382979; cv=none; b=NTaxjGkc/uezDmQmt6q4+R83NVLbnm+hluROW1tpjasOypQyvUVjvyVTpuZ406JfpAe/7vyDTdT9Rg8NA3//W2jngJMV3UVs62nm2EPOhLIGdknM9rL+aczhZLCMg+B0idnVKJW0BrEvfk7ufb+4kSmH8lLI9rsH981fS7vRvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382979; c=relaxed/simple;
	bh=Pi5ioL7+QlwhK2xj+V87banDOdI/HytqblsE8PVdBww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSD0H6NTYG1IgHWE/aiYMKMqSI+9NdF0SReEmbS4A/KEuC1BuvLAubCmUwKYfJNtgd6R48hRDOMkyTJAcHkckkof0G6JIxegQSbZUfFVNa9rlTaFvJAfvy/v3frcJzg+rf27lNfIdoxunUPoja/TTcpBLg9MQ7gozrYMrx1K5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=EDQEy4eg; arc=none smtp.client-ip=149.210.149.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="EDQEy4eg"
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gV1dy1Fl8zYdx2;
	Tue,  2 Jun 2026 08:49:26 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission6.mail.transip.nl (Postfix) with ESMTPA id 4gV1dw5XZmz3ZVDrf;
	Tue,  2 Jun 2026 08:49:24 +0200 (CEST)
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
Date: Tue,  2 Jun 2026 08:49:23 +0200
Message-ID: <20260602064923.877894-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602054643.452049-1-github.com@herrie.org>
References: <20260602054643.452049-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780382965; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=DwGPgZw0x+TRPp6LTlJJ324kksikw7sHJ9OQ2L+/eME=;
 b=EDQEy4egoOReHmEEzJZatwxtKWiaOx7OWdUUNupCG5oyOUX+m8XIW2M61M8fe/+LwHo9XL
 sZ+Pl9faQioEc8GpKUFKijOvqTn4vkIPb9YvexEwWzQxkEf7KO1QDdwECW/NpurhnBlFbY
 cCYNYa3FPy+t2wvN1Vh7vNBR2o9DouBCjpcQ7eYHBOV5L6Vm4+LOpw00vboOfxgvgwBRNq
 lsj1YVzEb1UGV/IYDPryb8S9UrZGliwm/yeQjfpcLhAplHgTZV8qp+VsZ4vODPJpIa/PoA
 fkGu6pqqASY6ISXUFNKca7gqY9q4NZyVA5KJTnznzLuLW/hdTw4pl2gAZLE5XQ==
X-Report-Abuse-To: abuse@transip.nl

Hi,

The promised clk-pll.c NULL-check fix is on linux-clk now:

  https://lore.kernel.org/linux-clk/20260602062927.467249-1-github.com@herrie.org/

  [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent

Single hunk in drivers/clk/qcom/clk-pll.c::clk_pll_vote_enable():
resolve clk_hw_get_parent() first, return -ENODEV when it is NULL,
only then call wait_for_pll() with the resolved parent. Same change
benefits gcc-msm8960/apq8064/msm8660 and any future cross-controller
pll4_vote pattern.

Once that lands I will roll v2 of this gcc-msm8660 series with the
yaml maxItems=3 + pll4 clock-name addition (replied earlier in this
thread) as PATCH 1/3, the existing CE2 + PLL4_VOTE driver patches as
PATCH 2/3 and 3/3, and a cover-letter pointer to the clk-pll.c fix
as the parent-orphan precondition.

Thanks,
Herman
