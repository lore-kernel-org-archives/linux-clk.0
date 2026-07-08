Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB304DBD96;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522654; cv=none; b=F7i8gdKIuOXzFgKD6EODneC9rdmqNFnrajTvtQQ9aQ313LVJiU+VT6o7ulSaCEfdsHIne84m0uXl1G/5YtLLDMGOh4ARy46F1ajHGb04cCiVgcMJFuSV5UUFQJegc4zXgH6OisrfwLboyPzeIisGcDaWCqgYmcLfB3WJRZjgfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522654; c=relaxed/simple;
	bh=P5DHpr9ClUsKnX04Srnimmbvt52JOhpiAio6zzOJyJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSBbX5xzRw0n7V/jY2jtiz0cJC5fSHu9+DlCWccIUL5scu9JbdiC82ZVNZoMgZKHaTMohm703OU9yzIrFFt4wqASZgqGCKXdlLIQjcY+8g7tNHspaZGbiewXLbuahz1yRAVAYsy5RYh6XUW4ANJvOdKyW/9mmm2WBge06I2dW4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NK3tlUkf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NK3tlUkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE71F00A3D;
	Wed,  8 Jul 2026 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522653;
	bh=a0y4e/gWco9TabFBBmcEnz9gkKxDe+RCAaMIzW1DFQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NK3tlUkfyDJTyS2ySeT2bRNh7kB548nTYTJNpejoOL4GZ6M18Wy8tMbLRD+JSegVI
	 FehNVa/lDO0sF3Ab6oyCrIpfCbBFicDsoZYisTSGruDcSw+fCN8lkuRl9g2QkWNIFK
	 ToUwSVXHrr8MIZn7EWfOnyTZIMNx7wzJa6c/vKDpM+1UNpD66Iw43WWXky1cDWd5Ml
	 CJrSmwfPbhBs28ISBB+1xMgUpyWMamMzksOtX4VA/DavWAJbGltc7DQ+8aVzltU/RW
	 GuxPqWU1jSVNE1ipgHgIY9IRzM7j4/u1RJd8hi5jxQHYUNf6f13I1BdCBIWZj3V3Qk
	 DA3JF4WSn6LfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Date: Wed,  8 Jul 2026 09:56:33 -0500
Message-ID: <178352261617.2235436.213725716394979189.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
References: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 19:49:17 +0530, Kathiravan Thirumoorthy wrote:
> Since PCIe and USB are enabled and consume GPLL4, there is no need to
> keep the CLK_IGNORE_UNUSED flag. Drop it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
      commit: f3d8db39d91e52f5db14047547b3eb3467446f78

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
