Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131818EB1
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150471; cv=none; b=RoFoNdVbVR/79RS+CQyYEllo6Eldlbwc7/hI6kEOZJQv74X8o6F2y3r3wdWZWuui7577e3fk819JBOKIy+SzvLUM7LJWMhZlXde2Q4Z7t4PpQqjWEGD9uVrU1Rm/041rHYNyJrxl/ljkS3y/VOA1xt6/lxLbt6z3SX5eRisJpHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150471; c=relaxed/simple;
	bh=iW+2MwxZl0ZdbB/L3OY6W9+ruCMTC/aklGipDUgUjjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQr7TrLVkV3/VOKyeOSZVd+LerOB+tri2MHwFS/bHxfbrQCZwqlV59+4Nb0lUXa+LXf9DHJiL33LEsWfu1Y/lR6pticeI74Jm2RhaVPfqXkAbVN7Zod2jvtptAaq7cHZ+XP8u+wLnIZsxkoGvcjuD/9BN2n4ra+O+dFabpNTECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+OcriC+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+OcriC+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso1125692e87.3
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 03:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717150468; x=1717755268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uVK4/o0nSJ5P4BKbceZnTHVyCGxP2KMHlSbj7pck3w=;
        b=A+OcriC+g3uCc6qkEGF3mwpVPegthPe9jQAt2J1frg2lR3V34L0IIRRC6XlcPM6U3p
         iHmaRszcrm0ERvsYN57R3fSdmyu/MZ2uRSKnekW6GwTrqX1D6TIU2gzeSL4o7zQnhcIT
         CoN36ysgv+zBSHb7zdzKYhe9whHyFtgTRxMs2DmwM2uIbjZlBsXNrEVFOjKNCA8UqmSU
         oNqx/aUVrR97tgyGl485FMI04k+ZoTUeO4xvg5bJIoOtUDED8FKd504+xnx1T212GoG6
         yrHaTTWh9wFOj954MWzovpuAXnobFEIYOmNA9rzUco66CDo7Ey+VlWw3ljY0u1cava81
         u8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150468; x=1717755268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uVK4/o0nSJ5P4BKbceZnTHVyCGxP2KMHlSbj7pck3w=;
        b=wJF2v3I5IWi77elrpSUNx+TPyq0inaU+A/3MPgfYskxiXeV4ZUQuWZg9KybBPTdAr/
         AdR+34ORP3r/4VR9SlRuG2FpEj2P/VFlPU+y80zcPQX1+hAPxKsbSoEckyFo2M6K0jgl
         EEb7Zy3DYiiPwirTCUZfUijLY3an/fSCp0qxxwS9o8GGwTlUoWL1l+35l512ZniF8xZe
         j+mLHTWj73dD3eL1u9DQBW9GYhDCKXayG7h/DzuHetTa06mGjVTNZ5bqqDxXN2lP1DLS
         N9wYlZ2bDHJNCYa0vY0UKJhSIGbk8IPnHsMmt3+eec5qL5AubQGLcfjXUKWVqsmHRgPh
         /npw==
X-Forwarded-Encrypted: i=1; AJvYcCULmAjCyZM8Lf8hRN4kW3USc0sEabsH2vhvOPatXQzmgZTE1S0qUKFYx6OdW4hezeljPRgBETAcslwdXnvJtMG+JORRUkejmGFY
X-Gm-Message-State: AOJu0Yw+3A14U7r6hjxZyngcIfOfwHfthnzjHCmxbdWSeEodfIT+mLD9
	DVs7bTdfyWUZndw2TV98RDkB+7PYEB+QOsMQMqG+6pmsOIIg/iA+H1goNjdqafQ=
X-Google-Smtp-Source: AGHT+IE0yAaxrFJoVblzxTX6JlAyNNVlbaz0ZnnFmbAcZMCyW4pV0KfGoc9BHRMXY9m0sjqWYBmwqA==
X-Received: by 2002:ac2:5b51:0:b0:51a:b933:b297 with SMTP id 2adb3069b0e04-52b8955803cmr924180e87.2.1717150467919;
        Fri, 31 May 2024 03:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d75c20sm281646e87.166.2024.05.31.03.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:14:27 -0700 (PDT)
Date: Fri, 31 May 2024 13:14:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com
Subject: Re: [PATCH v3 2/3] clk: qcom: gcc-sc7280: Update force mem core bit
 for UFS ICE clock
Message-ID: <5zsjo3dpeujggxev4rd6v6rwxupltw5hoyeeaqux6hw4yu6uzq@kbhwawpfj4nn>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
 <20240531095142.9688-3-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531095142.9688-3-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 03:21:41PM +0530, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock to force the core on signal
> to remain active during halt state of the clk. When retention bit of the
> clock is set the memories of the subsystem will retain the logic across
> power states.
> 
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc7280.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
