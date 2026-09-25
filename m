Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2E4028F2;
	Fri, 25 Sep 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347306; cv=none; b=Bj6N7Owsq+Wzh9UoF2Oxy2s9fxn9vX6ee39XMF+PwdFGNK0EcIzW1pCpbx+vvXvdaG/r27dwZDAWsT72ANLoSNbPey/xkV14Ij377izPTUYwxIo+ic1ilypNkgsLU26Nz7jqlYgTAqiDYxfMMD6maeOCkH9smspaChxol5WGrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347306; c=relaxed/simple;
	bh=ac7E0wRBO22/ndCYQWttv9evdjV2bvZYrPw2jzv3L/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NG3CVL9gwj17TQCA22RarTvkapLDoguEaUwEaCLuVnBlP+cGdvE6icvYK9uxcFl8oy7vZTLZ9OFmgAM5nWxk2/X4hNmhZx6u8eCoLu16B58Z8dANKYZfxN8y8x+ldFCCYraYSDiban8J+1C9kSIykdGtU0CJxhJlB7fsUXAEbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4Gwst0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4Gwst0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00D61F000FF;
	Fri, 25 Sep 2026 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790347299;
	bh=UQDSKuybRLlNXtqC2my8yfAy+Yv3ApRGxwG2aVs6mS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M4Gwst0e5w691CBpEU+zIMfM0w2ZMyQIGYs0Tyie+GdYPbKaugn2SWLe+qVc2a7wS
	 sedZzaFUi8w8GqOmyq3KOfUBjVTCW7SARFf8ImXYwIJAU8cGvdi646bZsX1iR9rv6Z
	 4GvV0Sx9tFqX2K8YESCDw9tk670Xp0y/N4LbMjcez7dzYNaISnAs3xr+sqzvV30Klj
	 zoJF31sEwa5YImS/C/MsXDHQkt229WWyu/V8pB6fB7tj39mBE+WY9XNrEKZmUqe4xv
	 tG/G37oiB8SRuT9l1WLaQsyT1ztb8emhbn++IhKFKQZWuK6fd/XmtrQTyAQnv3EQlm
	 3WzAYZ7452bzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Date: Fri, 25 Sep 2026 09:41:34 -0500
Message-ID: <179034728897.1105338.6068263153567283830.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v2-1-67275f94aaec@oss.qualcomm.com>
References: <20260924-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v2-1-67275f94aaec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Sep 2026 14:47:01 +0300, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.

Applied, thanks!

[1/1] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
      commit: 51ff9ffa18758c465a1a67ca36a78c2a8a5f3b2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
