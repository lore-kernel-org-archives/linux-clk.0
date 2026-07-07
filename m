Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB738BF61;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394532; cv=none; b=u9YFQij25K+Rtklhi1QbKLFe1M+d7aXNAOSeKrG6KnTD3ypnmSC9jlPa/d5RVbIzjT53wzscesWrGJdvApFvQ5cuEMs35XRsfCs+5qabdSI9benImW57Tgsgh6krPcay32+BY+2KGQW9N15/OuQOhUN5zews50gp3kobZLIN0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394532; c=relaxed/simple;
	bh=+Q6YYHLhvahJ1H7KchgsU99N7ZVa2sVOllalxe3zHf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bixk2Y/DvQjNWCnKvDxLDx77m/FaJzREJN4ojE74RdoWqVGxRXtpTC/FnzKxe9JAsIMbhFqJb4DpiT193fffcC55INu60JyJBL3x0gPFQbAdcrO93pa5tm7H34G9GRkKKijhq1SDIMWxZ0H+2aj4aO2YhpFtfeKeHMfCrIs9xHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cjyg+xT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cjyg+xT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27191F00ADE;
	Tue,  7 Jul 2026 03:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394526;
	bh=f9jizBEFpEuVKna4nQ4iZMy3xkuiSm5a1pkyONdWm54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cjyg+xT8CGw+YJno/W5Vz11hjm0BGdYTl9zJRVPhRSTvozLVi7DREJNa02Y7N1B7/
	 AUr2+RrbbRY7ERg5zHIJxg+0feapCf8SjA4RIoX7tK8xNqIvLhRAo2K8J/rA+4EKP0
	 3N1rMpzq7X8e3FWe2iNT0os4hJbmgxj5B04qQLq2m/y+Jlxn96kAsQtm+1HbBBmxER
	 P/eXC+4ApI19JaCQrIkx8Q59SMbYXUmClE3GaIfhVfcIh68ia2gZin8sP+59FqypVd
	 r+zMc5GYz0RrlTB8yvi98JXiC9FeG4p+ZomP8QNxah1rDgC6NBRWTICMuG1XLaworF
	 g2q4YYIOYWm1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] clk: qcom: Add EVA clock controller support for Glymur SoC
Date: Mon,  6 Jul 2026 22:21:39 -0500
Message-ID: <178339449926.1938770.15333855977275297563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Jun 2026 16:37:51 +0530, Taniya Das wrote:
> This series adds support for the Enhanced Video Analytics (EVA) clock
> controller on the Qualcomm Glymur SoC.
> 
> The EVA subsystem handles vision processing workloads and requires its
> own clock controller (EVACC) to manage the PLL, RCGs, branch clocks,
> GDSCs and resets.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: glymur: Add EVA clock controller node
      commit: f135aa4dc1aa43bd55edb028f02e96c7ec8b2e63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
