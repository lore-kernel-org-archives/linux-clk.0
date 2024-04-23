Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9B134CFE
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878098; cv=none; b=XwmBBZa/UZQkM/hwmjvWPPbs5dkJdCsYUxH4zxuqJMUCtmCGcK810im4TLQIkobONqppqW8QNHZkDgbvQ8qBfsZd2KqU/45A30Nur8PVGt8aQbIbOyHFsaYTmKM5/75y8EftvCxTPR6dYpTaesZ15FXJFFjY3BHo40GejseNnLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878098; c=relaxed/simple;
	bh=NZJdF448RrsCPNbeZK/mTKE+FYV/tNx8iYNQyTG8XM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbjPd6WfA0P1D9eYtc6Nd2e19SMWegL84nRqZoppCQIRp1JAKqul45hzIv11UHXzFyEGChjtThdG8dHFxDqtVUaEcGhC/TDYzDbyojse2lOg1KrKOEtPEdsOivdRfW6He8zioDRk2VHvJZ8nyrkvHdWBwFDxHvBUDav07RdTpCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lY1YWYB9; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY1YWYB9"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51ae315bb20so4125365e87.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878094; x=1714482894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsRbJyNM0CXnE8F6+OcG0OzXSZWaTx+tIqNQ0z6QZng=;
        b=lY1YWYB9jTD+1ad1/CdNtV/nufa2epV5mQKsP1BvZmEHlCjvSp121PKv1KuU7zD1dt
         Wav6euPVjw7B3POL6VwOX/zsn2NDRFXyQ1Anie8n5HIGi+56CuwhndNpyHsVozJDkbTa
         S2YM8zwny7q9zT/elAUJCeWBQBGWc7KMC8OzstNVLESZtZoPYko6Pc3wcAH/DW3ZSPv+
         xruN8anG/4ohpufTBjiFtdWQykYeEo9YJQ1amW19OgEH3ExiB6I7aSp3RJ9M4+2xwb6d
         9RDzDFhQESGNbVaJpjy1f203OzFcaHUEd7OD4DYP6+SnUg9vA32H/b04RVAj7OhmIYdU
         h0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878094; x=1714482894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsRbJyNM0CXnE8F6+OcG0OzXSZWaTx+tIqNQ0z6QZng=;
        b=uerNrtfNijIHKl7p/aI5Cryu966/v9P6K6S471OuYLh8p1Nq2xz9ziEFL1vqurEK/k
         ngcHQv57YOzqyrBhW7wK2UU/NODp5j1+N8ttBEyVcu/0LW1kwoYQdRnEBd05c2NYrX96
         +yatvl5d5Q24Epgu0r5Rfph1xKuIixePz5DuYSuwFnRhoL7X7Mu4DPyZU40qAtgnPpUx
         CJzY2eTq/ultsLvGzNa/W0I0Vr/f+ZQeSeH3dFeUYM1PoLoCzpzVsmblzeUQVdXWIaMC
         k8KdWfZOV9/E34tnWfcrt9AY24mn68Qy+bS93Kr/pAaq/iDbdb/dy7dyCZT6yZdDOhrG
         O+gA==
X-Forwarded-Encrypted: i=1; AJvYcCXwYaoUSIz7yxWMo8ngwp65gA74i5J1orl+7pmNtrOcSmxTpBPQwJkeu92RWvA7ib2iA2es3xu1+0D0NszqVKUBaCy+X8tPkFAw
X-Gm-Message-State: AOJu0YwU69qm5D1gAcHTeFOMDQqf948EAEkA3vA/4TLp+vbb8VnBr1b/
	5GrAcIGRXU+tmRFiBBVJkWyidm7d8DEB4EgcZPeMnzu7g/Jw1wf/FumyRGKN0yE=
X-Google-Smtp-Source: AGHT+IEftV1iNFQoAzedq7/3dcHwNw0WwRRh8jVLELtQAgUWXAt4it0wfg6lRuvpZy+z3o3XT9J3Tg==
X-Received: by 2002:a19:8c5d:0:b0:51b:18a8:4cb1 with SMTP id i29-20020a198c5d000000b0051b18a84cb1mr5142819lfj.27.1713878093986;
        Tue, 23 Apr 2024 06:14:53 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k8-20020a192d08000000b0051ac9a297aasm1530900lfj.141.2024.04.23.06.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:14:53 -0700 (PDT)
Message-ID: <b46b8cbd-1d58-44dc-9aff-ef11d9cb7d33@linaro.org>
Date: Tue, 23 Apr 2024 15:14:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: camcc-sc7280: Add parent dependency to
 all camera GDSCs
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-7-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240318053555.20405-7-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/18/24 06:35, Taniya Das wrote:
> Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
> top GDSC is required to be enabled before enabling any other camera GDSCs
> and it should be disabled only after all other camera GDSCs are disabled.
> Ensure this behavior by marking titan top GDSC as parent of all other
> camera GDSCs.
> 
> Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
