Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F604A842C;
	Thu, 17 Sep 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636053; cv=none; b=GK/P10rJtEfDEUYegIrlstQdKFBV4LQ+bFTLURpIQOVBCqpVNCPrYxBdUfr/6Es7UfGHzon7BjseZDSjeLNPfREaVHAMnZy6cMxAXDbvoQi97Dgk0py64IVhrgede2MlTOC68gOwtYNfMj4MMkcwu1sSIMfW+1q3r6Ox5H6WSkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636053; c=relaxed/simple;
	bh=tfsM1f2ref/eXtqH2Cf6LVRJZHCRrKTRyA7K43wzNA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UxhMABCSy8/wsTWl1wBeTTSVKLUxkapxaPhLYyVspqsfUT1lTov+DW5n4rRoWczbSIZtxX3TDjJu/roUmhx2/TsfbN3kIOdwkTkKgCiFmS1Nb83OzvrAl6RvADTJfQFmS33fOSFrXQ2mnc9RyNAXlrrN8IKrnKb66TwjBRnDUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rvkh+kxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rvkh+kxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C87C1F000FF;
	Thu, 17 Sep 2026 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636052;
	bh=TaiYYtyiBc1r7iR32LOP5dqIH3a8dZBL18RQM7tierg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Rvkh+kxKG8rA2hM7IjdEyRE7MJFdkgqXsoEidCncOZ0oGCJqGjmqtI2OarAwODWle
	 CO+OLAj47B+5wn9RgESV22u8EJUgNrFIZTldcSx7wwSj8zfeE2yWyxno52CSikdwNw
	 4WLePTJ4uNnaxHvijghBLbEd4eD3sBWYko7x+fgEUIVfS14onGGCqJUy5QziQIPl7A
	 pGHq1tvM3yhwS9BHOJozzrqhnVP+1IeKGFb7kSL9GZ+EJqEC+mFMFNp6xcQiP+nRZz
	 aKojPk0cp9bXkTSdiT0DcHL+c/uoh1xqrr0a+EkMzxPavrxZqIcz9MNg7faEBYi7TR
	 44ff30G1suzYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 17 Sep 2026 11:06:55 +0200
Subject: [PATCH 3/3] clk: qcom: rcg2: Clear force enable after rate failure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-qc_clk_fixes-v1-3-5531cb00514b@oss.qualcomm.com>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Amit Nischal <quic_anischal@quicinc.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636037; l=1246;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=RO1sNpn4JQNtrQDDmpuHbm0BZGWXNHfzDAC2MdMrCV4=;
 b=Tl+VAzaW6NWvrsi2HFune5kKKVr7sEDnt7ZgoVRzsGmW2s+1q/FW5yqNIP0lpER80d/bGN2ZO
 Xo+JRw3DUaUAGxOwJv8swGNJzGwqrH6CR4sNx+xuKOchgaIW79bqleU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Shared RCG rate changes assert force-enable before programming the new
configuration. If programming fails, the function returns without
clearing force-enable, leaving the root running while CCF can release
temporary parent and resource references.

Attempt to clear force-enable on the configuration error path before
returning the original programming error. This restores the same cleanup
performed after a successful configuration while preserving the primary
failure for callers.

Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 54d122e2e0d6..c44c51d860e1 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1364,8 +1364,10 @@ clk_rcg2_shared_force_enable_clear(struct clk_hw *hw, const struct freq_tbl *f)
 		return ret;
 
 	ret = clk_rcg2_configure(rcg, f);
-	if (ret)
+	if (ret) {
+		clk_rcg2_clear_force_enable(hw);
 		return ret;
+	}
 
 	return clk_rcg2_clear_force_enable(hw);
 }

-- 
2.55.0

