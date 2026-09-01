Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FA383325;
	Tue,  1 Sep 2026 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228618; cv=none; b=nRJJG6luxUYpArAHfMaXW/78VQQOkq1AG27+n+4KMksQLoP239cBZnE+iV1gUbtHb2fPNJpSfTfjpSBpAdYqJXk4Ti+F2Toakd6Qluvs9jhMrfDEi+S+J8aCqmiDyIkc7+/gf0g4mjNQIEOOMC8O4/WmPxmNjVKPTLlFz5+zoAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228618; c=relaxed/simple;
	bh=KDZNEptDxqn21WVp6rhBAFurtruHichB6swv2SJ+rig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OwWPRUEbaC6a1sgbSCGn6gk7+YJwcGFk/1D82bxyZ4610+PFojsV1kzs6Ge1LkFSoN+wUzINa8sZcYTeJrO/562/nOy7VaMLAHB4Zew17aOcKJO+6H8ygduqKrbBAPplKZk0oyZ/czPrL80SBm57XNwZ83ZygA8ZEnOLRe9q7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhyxDu8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhyxDu8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7AE1F0155A;
	Tue,  1 Sep 2026 02:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228595;
	bh=eCk1CZN0wFlINJi25aTVwTqLKng9uVwVHYgK9fi44ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MhyxDu8UKi7f9LCpMUYvxHlT6UOgkO7zYnmbMfWonbFFD30VQ7fxMQpiMo/r3y2+R
	 J7YBkjdPy58QfXfDz9BS06IkUMmWA7IorsBphgVPcx03L5+Z7KDFPYk+IYU3seykAx
	 1cRvN2Fz7oSxRReF7JRY31x3tXYOjYNT5BqXzmtcX34BRRsJOktUyERwFvLelQ8vXV
	 BhxTCdhMqhx2dYpQuq5eAEKoK8qyju0TArznYQaleaDhi+1H26unRs4u05ul8ZzSlc
	 LvtpXPgjr/ve9p9EpBdBCSVorDgrXPJ0Hhb/sfqK6lZxpYMPJLr0S9WC8TpHo4WsvV
	 MUQrU1h7ZoqAw==
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Mon, 31 Aug 2026 21:09:31 -0500
Message-ID: <178822856237.1835959.13939831006811098517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 23:00:32 -0700, Qiang Yu wrote:
> The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
> PHYs and requires dedicated LDO supplies to operate. The digital
> control interface for QREF (clkref_en registers) resides in TCSR on
> X1E80100. This series migrates the x1e80100 TCSR driver to the common
> clkref_en helper introduced for Glymur/Mahua, and wires up the
> required regulator supplies.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells from TCSR node
      commit: 4d8ff3d92241d9ae4fdd5fed7a810a116e37eb0d
[4/4] arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
