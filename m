Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/MfN+qU"
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408079D
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:02:11 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32f78dcf036so3157546f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700478130; x=1701082930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HytwA7HVysgBJScXXutqEK+0fdWB/b6Ao+3Wu2cMOOA=;
        b=m/MfN+qUw+jY1BHl2iTTNPAMTu0rRc0v5pv/LSGhhCpeleb5remyCa3E4Ak/ehmbW0
         yP9QC3LF96IhNCyt8ynBv41oF0Elwan441L/+nrUdPxB8B4sGF5aZDiqa1CxxcPk5s2y
         XMTfY3Ujq++rkVrj5wnQ/mEbtE9LdkVojdpFqdYRqtx7axhkq/f0jQnu7fjIPFHsBUn2
         rO729TEJnyeLxzZ0RODEADAzUhnSR50bQwHMukUm/vJlW2FVvBPqmXe2zdW8C7zHL9nv
         2NO3afsY07pTOCtnoD/+lmocm+YULns9WCCW7hghto9DiCUGO4zvudknTqy329U/y9GU
         vkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700478130; x=1701082930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HytwA7HVysgBJScXXutqEK+0fdWB/b6Ao+3Wu2cMOOA=;
        b=WOUjHI+g7T/ehuV/Oo0T/hXS11i6G3zE8Vj0wDtVZQosxmybYLhYfZsxGGyIr3B9K2
         9V74p0WjW4dNptDMGnLXx7YhMtpoXyMOSzbQDlljCyodQVVFR3SoOHBqJetAMNCw8+k/
         +92sLfvBYouIRzHmRA4PL06UfKmyXmkIiPcQSf5QqFVzxXQFnTREPSKxlcGPZfnRESXq
         eDEFxu5/SJbqhw3v6kGmvBhg8ng12gX9qVDsAGo0NtRo2dZXtf9LOfN5NjlHw2SKD9XF
         M51zGTGLxz+0GMFcp9yPAv5rsmGVppcCRGZNTeDq1rdE9zEnVo9OTCrl/UneiNzgKjLP
         MUDA==
X-Gm-Message-State: AOJu0YyOdyBH8nF3zigW2o42dq+gvP60dY2qz4XSbOEtgSp8fFXOSY9E
	Wlfnhoyawbq1nVUp8rQFOn+RwQ==
X-Google-Smtp-Source: AGHT+IFu3vVwHKbXDD1C9QxIgvpCTCFkU5meq1IURj2o2nkB8wQpPG9Pphbrie1MH1TmSnRBN58iLw==
X-Received: by 2002:a5d:6d86:0:b0:32f:7a22:8b42 with SMTP id l6-20020a5d6d86000000b0032f7a228b42mr11134783wrs.23.1700478129621;
        Mon, 20 Nov 2023 03:02:09 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b00332c0d256c5sm5916490wrx.80.2023.11.20.03.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 03:02:08 -0800 (PST)
Message-ID: <567a0eeb-3116-4103-b61f-5d8e7ab1f768@linaro.org>
Date: Mon, 20 Nov 2023 11:02:07 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] clk: qcom: Add Global Clock controller (GCC)
 driver for X1E80100
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: agross@kernel.org, conor+dt@kernel.org, quic_tdas@quicinc.com,
 quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 abel.vesa@linaro.org, quic_tsoni@quicinc.com
References: <20231117092737.28362-1-quic_sibis@quicinc.com>
 <20231117092737.28362-3-quic_sibis@quicinc.com>
 <ec9d03f7-7158-4309-9a04-b08c69b89f39@linaro.org>
 <2e0d2c55-fb2f-4903-a555-f51019942c6e@linaro.org>
 <c8cf229b-4d15-4eca-bc4b-61dc67d63e91@linaro.org>
 <4af8e7a4-0506-a08c-f294-d055fb463af8@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4af8e7a4-0506-a08c-f294-d055fb463af8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2023 06:42, Sibi Sankar wrote:
> Bryan,
> 
> 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use floor ops for sdcc clks")
> 
> The floor_ops was introduced in sdm845 ^^ and later propagated to all
> other QC SoCs later on. It makes sense to do the same for sc8280xp as
> well.

OK good enough.
