Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97F338D40C;
	Mon, 31 Aug 2026 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207698; cv=none; b=IhPAwhDNCCweb8NBeFMovivqOt2kZaHD2NHPeGydbof1ELT5qBLq7jcmkZqNy8PXZc01LiTiNprq+R4xMXfX3C49MRAHpqWIxmRIa5HJs336HUAR9dFX+EzMdNqbKICmSKgKWkN8bAychs7HhX2lrsBfEGF3k3SCcgpZqsrjo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207698; c=relaxed/simple;
	bh=KtsGR/c4FDuN1EkdvWvEvLkCsRbT0DPI/6jL3tcIEa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PF/4eW2NPK5Tc0hJfagWOuNYZ/ZCbuV7crY9fISNu97tYHH8llpSRd2Hb2135EbN3H7AVUs+AI8m+c/B5QpoRBszgJA6tjkoEcPFoaT3nD88KK4wb0331pydUw/g10gnUnHgGMQVt8FAbC0Qe8+VvbCldhZQRzpEulOl2gvLbvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6A00hdh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6A00hdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F6E1F000E9;
	Mon, 31 Aug 2026 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207696;
	bh=MZ89tN5vVH8uCtITq+JEvFsNOoTfch4rTJIXegQmoag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k6A00hdhw14dKpTLJKS64FoKVo5u9AGWHP3EgZfldQvKiIz70d7wuGmAbT4ptKT/l
	 e9MCON7yi7pUXtBChaz74YR6yHSMRamt7b6aI2nz5R19brDdKjqRmdiWUU3UTAyuGd
	 hT5FuIJq+ulj/YUVYZFLylhr7Fbaz/yxy1d6uonDFCLf7/AJWO5SOYXnXyvMJZCscE
	 zXvF6392TfPioeOKcalfRERABw21Kg5D+Z4zzCTYPBhJmNOeLjxeWxqD4aLWycgpYH
	 A64lIpHWtcb5VdgOhY6YUz8AJ/AYgRFpT9cjt0PQwa02RVdblnoYWYUBQ0fTjCU05d
	 udzDUk3B2lTiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] SM8450 QoL changes (dispcc)
Date: Mon, 31 Aug 2026 15:21:15 -0500
Message-ID: <178820768671.1699313.13951995417151222914.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 23:28:16 -0400, Esteban Urrutia wrote:
> These patches are mainly focused on getting a flickerless boot process
> on SM8475 based devices.
> 
> 

Applied, thanks!

[1/3] clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
      commit: 73df1b79026d71bf5bba04a55266db7bbe744e75
[2/3] clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
      commit: b1e06ad04819fc4842a96b22b0533a12648aeacc
[3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring
      commit: 2295d6a84179bfe853244c8ef26d6f54b29959cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
