Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7814E236B;
	Fri, 25 Sep 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354646; cv=none; b=a4pVbaihBox7+IbX9/rPCiIvPXPGJEd2OIzjpNBpUOSXObXotWTZTu57Xk3H2OuvFLtnKyGAXB6niDyQko3PWyAq7FMerUx9Awy+gjbkS5l5EfJ2+e7u7FjaY8jvLKLUby+Us4UKtXFzYI4efMtn2okZR8lwVPe7Gvd+86SeGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354646; c=relaxed/simple;
	bh=ks8Xyb6sHb9h5qErge0eLc7lDwgPIcH+1uHnitJtkBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wms9HlR+hO+0ZMFBZElKgcAGLI+P4UF9Ahz1ZOEYja919SjUefX8ISk+RnL/cmhwTsg8cdwttKKfR3sCsbne3sxn/gz6DjSoKR657eCKoPflIs5KKjtl/D8BXbfjr5i3g8w3BWB8eA3tB3vWOINpVWUxoj3ipw7pf6DCl9ww4zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex3Siihn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex3Siihn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF101F00898;
	Fri, 25 Sep 2026 16:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354639;
	bh=m6hgVzwame+7n9q5+gStUA7/kLCZ5WcSsZ1/K5Q5s6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ex3SiihnMrx7s1/uQLwMyUu9pDa8WKLqHFM+T8LTXyd7m4sbUx735bVX6B0+WkXiU
	 /nrlBDgRHBtSqBihpsBpKvc/xqfQ59vu3lNDhWHs9X/dhO7mpOz4Qd9zDbzMkIgCAV
	 eiSG9GT/W/nEs2XyUEVxY8Mmu9OXiwhpTrauik/21t+zNHGbJ8Q7FcOd1BFCsWGvnY
	 aAFmnNwfrSq8RCQnnF8b4AcHUOHS6wdDBw/Fde8DBKP4GHR0e5eOWFshS+5cz62veZ
	 tdeMXwUcXeDGypy0SttpqZH9SPonrAdVIP10WS69/S/Wa3COv274JLc73r1oPlA8BP
	 n0dhQ1fYf4fyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't poll the status bit of GCC_USB4_n_SYS_CLK
Date: Fri, 25 Sep 2026 11:43:29 -0500
Message-ID: <179035461238.1296652.10670548618940765756.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
References: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 21:18:15 +0200, Konrad Dybcio wrote:
> These clocks are PHY-sourced and their halt bits seem not to update
> reliably. Ignore it to prevent spurious warnings.

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Don't poll the status bit of GCC_USB4_n_SYS_CLK
      commit: 78e4d1b04e7e79a49a274f7c6b203a32d8db14dc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
