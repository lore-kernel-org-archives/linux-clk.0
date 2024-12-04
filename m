Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B518FC75
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733350903; cv=none; b=jzniYge8I9aJ059gziXepLAYyX91nh2gFJ4InfpeXUJzngGlbSWxvFKpYdKXFjYVtchoxgUCiqVoGcFb/Yguqmn+Xz7awLcNoBmSG1+ApXhgEcFmdnd48+qQ4o4JSvo5pp38qidqCmSGGBZfeSkwJXdrBtuHYJk4RJEcOdrjaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733350903; c=relaxed/simple;
	bh=ynCQIKaY+RY+h1mU8pvSX2SiTqmZYGjRMsw+r6UeonM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vt4BExNNETX+Bj4nhvooTYJmjDR2QhO9FfmA/ZIFj5yH/dkzoCvaIY60a5JEsaUStfWA+Prcz4J4pRJLm/6o+e49ZXwZjG1DpZMtoxIw7Azbf5Eu0Ly5oIz2emawH8AxNIbf7cvjaq9czhoY9Y+AywXvtPAx4MVOPsAt6l0McjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unDacFOl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unDacFOl"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffbf4580cbso2104821fa.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 14:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733350900; x=1733955700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssroB42yRh1u1AaAuxmK7898utt863yn1OoYX0qH900=;
        b=unDacFOl5i0puQgH5ZqAGLQP6Bu2/0cjEmy2UhkiEVJxbtUYdXtq7jdVk0b+ti7qrM
         PzoqkZy5mLfancB2doKpbNZUeABrmyE+VS4cEP44A2O9EUZuCR4nwl5FYkaN2Rtk1+rg
         2UlzHAdMlMDHdHpDitVta4RJDQn2+RREkfmCG1V9NKUeyZHJ5hR81DnRlBXdfCmii9eW
         9tvJGvyYu4sqvvYTgB6nikP7KhN7Pr7eZcG8mHrSGRpKndAeZD5fbzeMqcHquHKm/vd6
         KmddrhPIdl0YBvl56qflg+2FgF1mgAu3t5rZ7gJXcS2S+7HeQ7Zdl2X/NIAUhfD26ZAl
         6uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733350900; x=1733955700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssroB42yRh1u1AaAuxmK7898utt863yn1OoYX0qH900=;
        b=Lj+yqYrQNOBc5qDDfY3EJ6tBNQZq8IZuL8XdNa90k814eikyAuaLskj+I0KHNySdFl
         NtcGKeD7pJ4vmsx51o905fbz6JPrOn5V7YoYMCzIxYSjK+FyMbvLTMETIdS78PLU0Ns3
         rpDSkyq/cY8iAJCY/wIf7g9eg5HXdaGrs0CH3JSQ4Mr4PrAwUqGEuL/g3jHay76sgCjK
         na5WLdzZp4nKxAIlrI2oztWrC0wDwIVDG9cQqfZU+K/nOldD6/2tXTSZ+/s/nREgqonv
         r1eFfRCqxFFL7cySVM0U/JpwbIcS9tTRnrifhMIJxGQ54NwfxmobudsKhIw7uChlZlve
         MjEg==
X-Forwarded-Encrypted: i=1; AJvYcCXT3f9XpUUeJzU1RogrK+ptANHsZ9FGRz52FnZYxrHuzu41GU2HhSEs/4PxnbjSrIZ7KLz/E2oX0KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7kGukTz37cmyAB5+dNnvEKxHAtlRACxsEcwVuvYvvxEqUQM0
	pL0AFLyq+RKsKxpyS2eNVuMM+Fw5Ja+hZzw0HMpX64qlSmr3OxkTtSOSqzHlI8w=
X-Gm-Gg: ASbGnctrBXnrucbnN5IhILx6ehMWScjEbyR0F0jubTnk5tn6FNlK4lsDy+AFfkDjmjN
	F0ggtOnzmk1HshPHVxtO2ZwdIofoh8qqjDUbdS1ZJg+jTfGqBRMJ9Q8retxNOAy+CB51h1JgcH+
	C37vgsLs3qhxpMFe6sqNwnq0vUHsu0vneIpK3N8LI+05C64n/yq7gXApvk6amNykbnNLP0nKPck
	JgjZQqtQDrN3ZTzcil/KpczszJzepRZxEDaHjr7USU/1Lhm6IaQG8MUUhN8qrNNH2ISz8uxXmz3
	bWhHpQeo5IylvEGUZcngtdjNABhc3w==
X-Google-Smtp-Source: AGHT+IFCUURoGURSazReJ3S1XWV/nC/IWBCyY9mrKUqoDWb/fFmY6dc28c8onAtnqSuGDAmJzp67tA==
X-Received: by 2002:a2e:968c:0:b0:300:16d7:456e with SMTP id 38308e7fff4ca-30016d7485dmr23309651fa.22.1733350900029;
        Wed, 04 Dec 2024 14:21:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020d8527dsm28411fa.6.2024.12.04.14.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 14:21:38 -0800 (PST)
Date: Thu, 5 Dec 2024 00:21:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] clk: qcom: rpmh: Sort the match table
 alphabetically
Message-ID: <7jfntcbeejobjwg5oaggma5ygzxfj6aiw2mgv7elreijegoywr@skol6frm2j6j>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
 <20241204-sm8750_master_clks-v3-2-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_clks-v3-2-1a8f31a53a86@quicinc.com>

On Wed, Dec 04, 2024 at 11:37:14AM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Update the match table for SC7280 to sort it in alphabetical order.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
