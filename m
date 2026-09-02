Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396493EC2FF;
	Wed,  2 Sep 2026 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385519; cv=none; b=mvaFzzVR7sryx0i2pPH3yb6LCadSMqKMhdnhP99LXtojKw2IceSfSU4ADHejInuRxfKtzTtHM+u3MPwKpUnHR8jiC+ae4KxycOvizz3m4rEcPRWaZgyG/Z/8+xLMbtvuLI+0rKspdLT5vXbtZjoBzjoPylViqIWi2Nz5muMUwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385519; c=relaxed/simple;
	bh=kwDRPR6oYByYy0oXYmzcj9hKyCQDeBHd4IefcGohk9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWXnArIi+7bNQ44VwydObU/Rr1TQZCE0JxRYteAKyAdAGc1rx592jDZ8mpXH60Ihl53yWxZsrFpxmKkgDdCzrbd3OOt3IbEac3IWaN20l0PWtP2lRAtDtw5IEX+Th1wlr86TF0SnQJFFp/oSVnKnzWtrIaraMhP9mbQ7ZDKb/V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7z2NTYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7z2NTYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283321F00AC4;
	Wed,  2 Sep 2026 21:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385505;
	bh=WIqQmOPzFzeKy6ikLir4/cGBCiLScFgzgyP1KZpREKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U7z2NTYfjNswCjU32RTb1hj246OPnweWVeRIiEQrDBXFCHcZ+V6n/g8EnyJkGdC+q
	 o60euhjsp/uNeLe3Qg8+a5S10jxe8nLCN0sWx+YHAsc/LjjgMo9gR3LuO0/eW6wvTK
	 6xTohkn6eGvTpynGKeMgPnd3hakCmTJQTPdEQYoUzrEWMSSOyM+aH3FgKtaazekQ+B
	 PM1bxP3FdbcHDSWHZ1a8t08bcH8Lj5bb9FS5qB4KwNSaRwY8JgRAtkRnx+jQD/4/uY
	 XbqqrlFZdItOIWQNbZZjXjpoz0YQhxXdcayVF2V6PmHOHLJrPjOitzYm9Heqlc+cXm
	 z0m7LG27RH7mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 4/4] arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies
Date: Wed,  2 Sep 2026 16:44:49 -0500
Message-ID: <178838546717.167607.2094697189829779748.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-4-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com> <20260827-hamoa_tcsr_qref_0826-v4-4-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 23:00:36 -0700, Qiang Yu wrote:
> Wire up the LDO supplies required by the QREF and refgen blocks on Purwa
> and Hamoa boards. Purwa's QREF topology is same as Hamoa's, so it reuses
> the same qcom,x1e80100-tcsr compatible and supply set rather than needing
> a dedicated one.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies
      commit: d9d07e230c45cc11a0046b46354e413f2353bdf8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
