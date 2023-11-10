Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C8179A7
	for <linux-clk@vger.kernel.org>; Fri, 10 Nov 2023 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1Jdl+C3"
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6434831E51
	for <linux-clk@vger.kernel.org>; Fri, 10 Nov 2023 03:49:52 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso1228853f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Nov 2023 03:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699616991; x=1700221791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnsyLuQheg+/3cWckMMZhRJ3W+3u+GfGV4x7we92iDA=;
        b=V1Jdl+C3z4Ec8wywSBc6E+1wXihOjgXL/Iz/T/GMZ6cLpRixVCxiyWky1gk59OGJ2q
         v1ZQf+mY9woTb3Ep2xvBvZj1slICFKcCAeouE5zljf5DJUHQ6V6/gRS92Tt5OsNXS1N3
         fVUvWY60uNZxgoJwnBOWAKeuH+YF17T41GWcG41lKHXXiyQi3wu2ek7m3wnZFnQsi7H4
         HMjz8pkp4UzamXsf/eBzbp9NosjhjOmy6mgTOCvXF6PyUXo2ym2qWww7SOsKZawneZDc
         nYcOspBTIIGpE4i3mSV5XZX2sEcLxdFEg63aTahg0Tcq5vSoE+zsAXkzPiWtm02HoBKM
         XRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699616991; x=1700221791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnsyLuQheg+/3cWckMMZhRJ3W+3u+GfGV4x7we92iDA=;
        b=YAUZWwbxscOzhWRCv28+tyusV4mFruebgA6rbMn5tklVRmJG8X55Ej3OfSp40mldo+
         xEQSLK1zte0P0BVxT+MIsPUV73j0NdDMRcCpwfRyYYURQOGPIc9Eepg6mhCVU26WYz6K
         wv+WH+1/9fPBgS7LYVyLTs1KJTYdg/rX4S+CvdzydTHYdL8LnZ8Q7HB8O51YykPEXPuz
         RRaDQISuWLBLWNTvfJFtR9WK6D0NZvmbePWXOjnVXGB6A+aMxsPU503bGYPDGLXw2Me5
         eLMmU3Jts2XosXFQXc94LLzq11XXMOzCpjedGHbxvLXJC8TO5ggKN3fxoh5KlCz+4y2C
         V0Tw==
X-Gm-Message-State: AOJu0YxO84io2h6dHuyt7CsBHrUp8q4B2DEfIQugLC4eNS/F5StwdRIT
	CJoBiVlbFD98V5wHejqJYbSqhQ==
X-Google-Smtp-Source: AGHT+IFx+qOZ4g+ruh09/Sbp8yByrjwyQHAeeoLBHucqNe+XW9cf4CGy5NlDwW37k1ZjtwdvqHRvpw==
X-Received: by 2002:a05:6000:18ae:b0:32d:c09d:6ec9 with SMTP id b14-20020a05600018ae00b0032dc09d6ec9mr6686800wri.7.1699616990814;
        Fri, 10 Nov 2023 03:49:50 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d45cf000000b003313069be5dsm1751210wrs.46.2023.11.10.03.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:49:50 -0800 (PST)
Message-ID: <31dac823-cc46-401e-85f8-d04544bd38c3@linaro.org>
Date: Fri, 10 Nov 2023 11:49:49 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: videocc-sm8150: Update the videocc resets
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-3-quic_skakitap@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231110065029.2117212-3-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2023 06:50, Satya Priya Kakitapalli wrote:
> Add all the available resets for the video clock controller
> on sm8150.
> 
> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8150.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index 1afdbe4a249d..6a5f89f53da8 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -214,6 +214,10 @@ static const struct regmap_config video_cc_sm8150_regmap_config = {
>   
>   static const struct qcom_reset_map video_cc_sm8150_resets[] = {
>   	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { 0x850, 2 },
> +	[VIDEO_CC_INTERFACE_BCR] = { 0x8f0 },
> +	[VIDEO_CC_MVS0_BCR] = { 0x870 },
> +	[VIDEO_CC_MVS1_BCR] = { 0x8b0 },
> +	[VIDEO_CC_MVSC_BCR] = { 0x810 },

Are you sure this shouldn't be

+	[VIDEO_CC_INTERFACE_BCR] = { 0x9ac },
+	[VIDEO_CC_MVS0_BCR] = { 0x870 },
+	[VIDEO_CC_MVS1_BCR] = { 0x8b0 },
+	[VIDEO_CC_MVSC_BCR] = { 0x810 },

?

---
bod

