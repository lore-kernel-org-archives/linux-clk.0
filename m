Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715E277C9E;
	Thu, 19 Mar 2026 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888431; cv=none; b=uhcaz02hOFYxNhedoEVaJmPRFEsDt5MclonDcGzrTA/hJ+0dPpxSF+nF3zQt9HC+U+4FgiLnHr/VjTx/fcotkRVZiSNKeNjAHk5E42jn+3BrwkywVfUuBIIpHmLX57WLnPSYKZbcvGdR062v0DuVAoKeDw12NZ+dIT6I6KUTXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888431; c=relaxed/simple;
	bh=WUzdWoZEsIp05iqyKAdE9Hu+zAQdC/kGFK1iJ0WN2KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVcSD7dfj8w88u4HJIiSG+OrbLlAdYZMcaNOyV1u/ohrIu5yWy8VKRXTiNV3iIG88fOAmulmhvi5A42G75SmpD59MUfFzbwxvS2BX+HgoGkMAXNZqq4HRKtpbP91yGHWDP+cXLTMsO/5ne5zu1wlLlWKyJKPXPDIvFkI2FmURcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhGl1KFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhGl1KFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168CBC19421;
	Thu, 19 Mar 2026 02:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888430;
	bh=WUzdWoZEsIp05iqyKAdE9Hu+zAQdC/kGFK1iJ0WN2KU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhGl1KFTGpVM7Q9wwj57RCMnyxirA7eGw4kTRQrKDJUimNQepz1u51NRpIwt6wC0o
	 ZEptQ4Ai5KoT+SXgzn6y2CP9OczIbZyHUYS72SfKNlRgk5VKXIIl+Maq7TblMzegm3
	 1oDNARwzF8ERycF/YBI2xxtObgs9D74g7fMb1j8OMRa49ziTJVZ8nKxx6WzhHinhQz
	 +XeOZxfZOZa1Bclg4k44XlsTF62Mw/Y+gf/EJl3RwwpELZKv5RUAW13rKHePd6IHCQ
	 +8fpxUZ48c0pvqvnvC5MA3twHC8mDP3E7SJlhFAxRK4dCNbG+fZIUIPtuM64V039UW
	 xVneJ9eM5wCYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/11] clk: qcom: sc8180x: PM-related fixes (and refactoring)
Date: Wed, 18 Mar 2026 21:46:48 -0500
Message-ID: <177388840390.11529.13605486035483008934.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Mar 2026 08:12:05 -0300, Val Packett wrote:
> v2:
> - collect tags
> - bring in dispcc patch mentioned in cover letter
> - add a couple new discoveries (mostly camcc related)
> - add refactoring to current style (qcom_cc_driver_data)
> 
> v1: https://lore.kernel.org/all/20260309010214.224621-1-val@packett.cool/
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
        commit: 76404ffbf07f28a5ec04748e18fce3dac2e78ef6
[02/11] clk: qcom: gcc-sc8180x: Add missing GDSCs
        commit: 3565741eb985a8a7cc6656eb33496195468cb99e
[03/11] clk: qcom: gcc-sc8180x: Use retention for USB power domains
        commit: 25bc96f26cd6c19dde13a0b9859183e531d6fbfc
[04/11] clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
        commit: ccb92c78b42edd26225b4d5920847dfee3e1b093
[05/11] clk: qcom: gcc-sc8180x: Enable runtime PM support
        commit: 733220662679da538c5c416b3367acc7cb212f29
[06/11] clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
        commit: f641773e10fa5e85154554b15f2aff30e050bdcb
[07/11] clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
        commit: 8c522da70f0c2e5148c4c13ccb1c64cca57a6fdb
[08/11] clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
        commit: acf7a91d0b0e9e3ef374944021de62062125b7e4
[11/11] clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data
        commit: b39ae8c2f3de2a2429caad9dd414db14f84bcc8e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
