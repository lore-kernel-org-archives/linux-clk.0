Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIWoXVpY"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469E1E6
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 13:08:03 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3331bb4b116so152156f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 13:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701292082; x=1701896882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9jFHV2GrUp0ps1JJpB9xoZzEO2eSz+0BnDBZmO9bUs=;
        b=bIWoXVpYSzInobRl43VhJAlIO8YRr73ZKFHAgmlKmt1c4cmNsBflJsAjGTq7q1Xtlr
         Q6j39YnZoIXl3SrOqQ1rgo+O37S3lWSqBLA7gedBE4VldroTVAaaFvIdj2WZaJ6Fb9Lr
         5Bc4qGWdg1N6Ww87GaxTSOg1Zzs7KA3mt7S/NWzCXBF9MCHMdhu1nbRGOZVunecVMLt7
         9fGZQ1Eg513HZ1V+cM5WcuQfYNQVnjevZRLNZaA7gu3yFNxMrx+NfiibVuQMfwQrQ2Do
         9I8oLP8mZ+k4y3nvpkLiXSGuEmhjUsRTB3M3ZnQSGkN8mTyxHwyVjADCpSucSBQpelbC
         psDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292082; x=1701896882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9jFHV2GrUp0ps1JJpB9xoZzEO2eSz+0BnDBZmO9bUs=;
        b=rCY4VDAqqmrh0Vj0LuajoFrwFvykQSn7+ynbUb7KLs8jJSujGlso/CGE9c742rvscu
         uCK0LbLbCpGb+PyOwyBjySoslOwJ92Ua7505aqDrbdEvOqyCRT3PrHNeWGE1layLOH2C
         Xz8A5GeD0DxKch2039LnlL8BL8HIalL3DOAtcJXJna9hjQ230DwzfkwVU+VuLTbpy33t
         es+wZ6dHAWwNrBaM0uAvEb86GsBWl92drd1D0SvyvXUHlGBdLCCXiTRMYNbdyD0r8eSB
         bmXFgoz6v5kokl9iy2QeiHV39Q5rDkQi7LFwvSVzwMuwm0uetQ4llEuiILBHCL2Em8TM
         R2ag==
X-Gm-Message-State: AOJu0Yz/DmnwMN3cX+19x6eRk+OV14/5BWHb/zuq7ZlXur64/UW4c4vC
	S9CiMkfZ8kTtfK0UC+Vv/fQNTw==
X-Google-Smtp-Source: AGHT+IEpKW5T6Mdf/X3bYFt6X7XSBnY76TN2RB3vLijvMEL2ZkKnEKMVbKRqdV8Xk1Wnk5wdvI3a2A==
X-Received: by 2002:a5d:6a42:0:b0:332:c585:400a with SMTP id t2-20020a5d6a42000000b00332c585400amr14557007wrw.44.1701292081556;
        Wed, 29 Nov 2023 13:08:01 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f2-20020adffcc2000000b0033315876d3esm3082637wrs.12.2023.11.29.13.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 13:08:01 -0800 (PST)
Message-ID: <9deb31e4-2e75-4db2-8a73-7c8b7f9ac03a@linaro.org>
Date: Wed, 29 Nov 2023 21:08:00 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] clk: qcom: gcc-sm6375: Unregister critical
 clocks
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
 <20230717-topic-branch_aon_cleanup-v2-3-2a583460ef26@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-3-2a583460ef26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 18:59, Konrad Dybcio wrote:
> + qcom_branch_set_clk_en(regmap, 0x2b06c); /* GCC_SYS_NOC_CPUSS_AHB_CLK */

Shouldn't this be 0x79004.

Also the logic here is - since its currently marked as CRITICAL => its 
fine to just mark it as qcom_branch_set_clk_en() which I guess adds up..

hmm

---
bod
