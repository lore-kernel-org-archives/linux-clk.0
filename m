Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814913;
	b=y8ykt82raPrxZuo4yGKfDixNST/bY/DzsH/29+ACUveaAZuST13d2/pETGaDisr2XoJX
	 2TPh8E1ri6492VW0LIXTrFze2PfoLa2tSJdNhpNW+l3RdXnqxGCV4qfvBfjs6HpJWqnES
	 fqfen2K8T3KfuEPh4jm0TNpp0qBdy4vm6BZIlSFl4ZN6i00Gfd5f3+OqnKu+tubPiKbI8
	 WBtoW0jFOca2+P+ng4UnGFT79s0sQ9qHIa+fldJpSOfeJthgXfVR/evmpJLIUacbICzyz
	 X/EF/O+3WqXD3BiZhwnBtZcy+3pxEFsM5Cza6zJ3jETeEh1Zc6obHGXKII4JrOWCPbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
	b=X+AZykffca3OmWOxjDARqxirL663O3Aws34a51eiKZBGa/U/y7DbzEAlQTQKTIeDbVF0
	 HTzFNU7f02bH03LtNN4aPkxlp19jVL7i1myny4Sh8JBIThphZ9ONGFrORGqPzIlE7HGwy
	 QeZuEhc1pH00bCAwYMKgnZCCNc8MUdTkQRouyakEFWsMlhTdKz4QajY10PFnPlMfCXP8c
	 Wb7uCUGsB3FMZOPFqZqX9SzXHzzIMBLhWlHA47EvpMFeN4y8NyfLdfZwXmqiqf0SrybKH
	 BBZGVpBmlFoAD7cRpKqezQWs/4z97/G10g8v2mLr7DER8B6dtIaRGTWpeT9q+k7kObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M99kwfSi;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05083606A33E
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05083606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M99kwfSi
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490a0e72588so1361456f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 23:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794814911; x=1795419711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
        b=M99kwfSiXYDaGIx7uF1XdR0bpmzIP9dhr2OliLAvg9RQc8PuyY2Bts5/uH4nMTRT0+
         j16CcAbMKX1tIbkgJWXQeHbvhOySs6po/B94UgKNoNcfQ3agpxYR6US8qeZnChZxD4NJ
         /5AU6V09vUbja8Ef60rghEo0KEYNIlki6r1q+gI2tYhsuprdkIx/QRxx1DooNAJ+YlG9
         +hCPKzWjzkbkbNH/GU7DFzfeQU4fhpPiT4IeWvO34Js6tkhcGnwk2Ye5UnLQjlznuhH5
         k/Loq0ZsaGWTniOTCenzy6or1D25MMpz2kXidKF/e7vYDuzyiGILbZUkWelIsp/Xz6VN
         4h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814911; x=1795419711;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
        b=qwSAleVghgLneOHqqecys5X4I8R1zW4zjHRz6KvPZM15M6Szt/qyBnuinmtY/I9btF
         nwLN0jHoGtUPG2E7YJ99Wzfw8ErghWssIew8Kb991Kik89bSJSDCFg7w8TX4RmGzzrMm
         dYxP5/AevIceCUCvMShp7daGtOZkPACbtyIY2gwOheZqYOK+bQwhe/+qUikLNtZ20/cU
         qO3UEvp2QKaklb0D+7S0TT7BVhoZv0YUmNCHgbezXPBwhVicsFmxhzjcCtJ/1GRnvia0
         RWwTOp9f8Wultzl4U8IXJRla/9qDRu6ZyvYakv++5Qe8lgVNljVvcYgUHheNFy6C1bvT
         kIgQ==
X-Forwarded-Encrypted: i=1; AL+hErGNZLJoD2LMPUAILbiG3eiMWClUDTfHScTQTNkD0m2JfmrrZodSk3D/rzPwKQiEToDbRQyuPxAjqEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pmzOM9PyT7/ko23cMEwAxDmrBJrpISmOZJtzmJlg2PscU51D7
	2jRDr/8KeIJ4Oygcw8mc38lC/b3FoNnAibS3DemTROZNbVPPVje2vfedTjEceiMdpEM=
X-Gm-Gg: AYBFou29d6w4YoT6UNRyAXVm0cT35Dw7u0PYMCHaYU4y+D1gPEvYofi7oypciWG9Lvg
	R39uH3phDgClD03kYdcLqEuwbxsOplbZZDA0dYzDgcyAMrMUfNSIDqliVT3nh3/Wpi3UFYgVer3
	FGzfalQFeZbrH2lvJJVyIAKymDA6h1BhqAnjCQTDDTpOBskF0VtjGogwdxK06wz4gwA3iJW6fd2
	Rg1WLNGNjYeZk6ZLJUf0DYtm28WpxURiJHRfC5ksKUrqJVVdAI48zyiHov+gOOm1b+D+6e3Nb6J
	JFihpNahEHwYl7+Ynl9IB3Wf/q5w8Nve2vAQM0Au1abGUgJj7+EW0JzbGlakqQ48k7Fm0DDtzWx
	VYRZpgAfC58edlIMFBglVR7XE+1xBokdYTxlPKt9sJVS+DwxuBvJUopMseqGfEIAGav4G9NwM3P
	g7I9jauh7pOxPpWw5NWn3HXe42LhUqt7TBKFeZJGLrL1t+AV4mOcVv6iv+5303IFcMzfgNDFT81
	q4rC+oAacIDJLt25VWYJ4ND2CWEfC7YJFgPLKkMwbzThi24hatjCxx7+pEcpz9CvXMzRX/3I8Ii
	QzCkTzl87IB+ti0UE/2SGLXg3Qtm9cGPf2a0MGLuwSWp8hKUQJWKGSascfzqW6gBF3ZAnV1UXTX
	MsIra8quF4A==
X-Received: by 2002:a05:6000:4714:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-49c71785315mr20347442f8f.24.1794814911273;
        Sun, 15 Nov 2026 23:41:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm20939365f8f.5.2026.11.15.23.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:41:50 -0800 (PST)
Message-ID: <81f79143-7b30-4b65-8d57-84444aa8a111@linaro.org>
Date: Mon, 16 Nov 2026 08:41:50 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 01/23] dt-bindings: clock: qcom: add SM8650 LPASS core
 & audio clock controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-1-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213487@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213487@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] dt-bindings: clock: qcom: broken examples in
>    qcom,sm8650-lpasscorecc.yaml
> - [Low] dt-bindings: clock: qcom: unwieldy per-compatible conditionals
>    in schema
> --
> 
> commit 822c52dcc683f4949600245b7d9f62d13802e752
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds the Device Tree binding schema and header definitions for
> the SM8650 LPASS HM, core, audio, and AON clock controllers.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
>> new file mode 100644
>> index 0000000000000..9c5207ee02f15
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpasshm
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +      required:
>> +        - power-domains
>> +        - '#power-domain-cells'
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpasscorecc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +        required-opps: false
>> +      required:
>> +        - power-domains
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpassaoncc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: LPASS_CORE_CC_CORE_CLK
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +            - const: iface
>> +        power-domains: false
>> +        required-opps: false
>> +      required:
>> +        - '#power-domain-cells'
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpassaudiocc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +            - const: iface
>> +        required-opps: false
>> +      required:
>> +        - power-domains
> 
> [Severity: Low]
> Each of the four compatibles requires its own if-then block to override
> clocks, clock-names, power-domains, required-opps, and
> #power-domain-cells (which also leaves #power-domain-cells unconstrained
> on qcom,sm8650-lpasscorecc and qcom,sm8650-lpassaudiocc).  Would it be
> cleaner to split these variants into separate binding schema files instead
> of using per-compatible conditionals for every entry?

Both are feasible, I'll follow the maintainers preference here.

> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
>> +    #include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
>> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    clock-controller@6bc0000 {
>> +        compatible = "qcom,sm8650-lpassaudiocc";
>> +        reg = <0x06bc0000 0x38000>;
>> +        clocks = <&bi_tcxo_div2>;
>> +        clock-names = "bi_tcxo";
>> +        power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +        #clock-cells = <1>;
>> +    };
>> +
>> +    lpass_aon: clock-controller@6e00000 {
>> +        compatible = "qcom,sm8650-lpassaoncc";
>> +        reg = <0x06e00000 0x30000>;
>> +        clocks = <&bi_tcxo_div2>, <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +        clock-names = "bi_tcxo", "iface";
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +
>> +    lpass_core: clock-controller@7b00000 {
>> +        compatible = "qcom,sm8650-lpasscorecc";
>> +        reg = <0x07b00000 0x58000>;
>> +        clocks = <&bi_tcxo_div2>;
>> +        clock-names = "bi_tcxo";
>> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
>> +        #clock-cells = <1>;
>> +    };
>> +
>> +    lpass_hm: clock-controller@7e00000 {
>> +        compatible = "qcom,sm8650-lpasshm";
>> +        reg = <0x07e00000 0xa000>;
>> +        clocks = <&bi_tcxo_div2>, <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "bi_tcxo", "iface";
>> +        power-domains = <&rpmhpd RPMHPD_LCX>;
>> +        required-opps = <&rpmhpd_opp_nom>;
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
> 
> [Severity: Medium]
> Does this example pass make dt_binding_check?
> 
> In lpass_hm, GCC_LPASS_CFG_NOC_SWAY_CLK is not defined in
> include/dt-bindings/clock/qcom,sm8650-gcc.h, causing dtc to fail with a
> syntax error.  In addition, lpass_hm specifies two clocks ("bi_tcxo" and
> "iface") while the qcom,sm8650-lpasshm conditional schema only allows
> "bi_tcxo", and clock-controller@6bc0000 (qcom,sm8650-lpassaudiocc) only
> provides "bi_tcxo" while its conditional schema requires both "bi_tcxo"
> and "iface".
> 

Last-time edit mistake, will fix.

Neil

