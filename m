Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686584;
	b=2KgyiHO6VKcDNLi6ARUQCL+itCda8Whbwi6sj7aZKFOXDrePKZd7nChUmDlf0Gi/3rS7
	 a67lVy0EaRNQWjaj1q6aTeLaWWu0B1tM2+5Uw4oc1c79jgEDtZYRr5wgCgjSSJEMWdSAW
	 eFcMhln0dEbXQsad/gkdA/d819BICSM1f9DgL2pVJSCShznGrWHlSoWHG88m6zpeui4Kr
	 7LTJabKOuV/rBNoW9O7pZrsqKJcbFSi+0haEx7CjPQ7iBTXZbkDrGEK8epzItrrMd/Rb7
	 k8ZQLu7a5maVV7/qqU/7oADlkjyekAidZNSyCoEDEPEQMU7rDUR0bTzrUDjJlK3tOMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GkJ+Hvopv5+q0wZYLQ8lIJJt9XgBmk76/q4ZT67Wlao=;
	b=Utikbu21X6PxNkSIIScT1YkRDjpRAUOJ24uNo2Qyw7L9RS9qVb+hhFGsuwsCKQ3WtWR/
	 0ybQlodcLnjlmgIZNI0w4xneDhMgX+nyfm6Fq/D+zHedwmrnbEMp1Cq7/OuNFkUW3g0ls
	 mSqoudgXJ8IA+LoCG6VU9hkWRVncQDtDEc+PQT04WH4ktnkHZBWC64he3eTUL+Ciqi9ds
	 jy1DlMxo5F1M0B60FKJO6bgASrzmADdJHPUk+RIOJY1D0oCwCWcbiFRrzFj86yxwbEr3z
	 31vqXg6wSt6XH/xJn6uMOdLzQG0S1Tk4wNF5PGITbCIaoIbJimNj0iqDLw+aLTWYRJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oHV3GZ+B;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42677606A31F
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 16:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42677606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oHV3GZ+B
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso141735e9.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792686582; x=1793291382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkJ+Hvopv5+q0wZYLQ8lIJJt9XgBmk76/q4ZT67Wlao=;
        b=oHV3GZ+BOTwZC+c8lxLq49WfhfW0PWb/0U/RaxIO6/PZgNqk5SF3i7iLhnn22M3QBz
         dlhwdFim4mweRNChQa5d7ME3I5r9H8SirGwgnN3j3aYYzxJiSGghoXppQEIRmkCoeE/p
         AVoMZbdqlJCyVBNNi1mDHbb6hUnBeREwZYVKllj6Y8XSkcFk2HKg8LW1pQYRYihyKsUj
         AZ8hFuYi7BMk6iXriEOh2lbk+H1mkTrkaTC49V5IOsGrQWwkNuD7peeqk2vIleaKRiSF
         BxI1l8cuDR/U0f3LK5cL+3HDFfjR8dbGZJgr4LU5vQGGvCsMWxSbMT7pyr8Fb5cvCdyz
         Qaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686582; x=1793291382;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkJ+Hvopv5+q0wZYLQ8lIJJt9XgBmk76/q4ZT67Wlao=;
        b=j0NuQ3mt3SJbgp+hSffgV1ClVFaOfT/mO6Xh70bX2ocxbbGvNMKMTtR6Y2/0cE3nPG
         k4MMrXiobuoZdyao1IImpsrkE8gQwBHu5N4tqFbfmUKCeA/Pyp/ToR8Oa2u2V40bVnm5
         QWOWTncq3F6fAowIveraumWqREEXMThwbd8U6bv02ZsQLexs1BmfQlNHv8wV0gwKG+fM
         qW/iw0MDMSXq49Oqkj1HFi47G7QBTX4hKp44bxIq0sohAskLXml31VegKS1GayO5AJcL
         r/s58IUMmyrNPth78uWsbIymxI+0SHx3qqeMoVlIZd+7IaNXBfrOloteSlzaA9/Exzk8
         A3Ug==
X-Gm-Message-State: AFq9FYJSixN/Y13E0U8vOjREylMBqiA6PaFwtJBNPT4gWYGNG3XkM5cj
	OuZBg1Mmn+j+Yjo2G3dr94x2Ke69XyA1soQZE6IpDQDGuixeNIyl2tS6CNIzla4HcGgImXu5CaL
	/BRiW
X-Gm-Gg: AYBFou0bQtpCChCXWZXXFJNieFcbffdwdL8M1h8r+itn/mKNzdxeDTav8k/LIbGj0zu
	mzUT+OtAaW4htovEwldjjlC4GpBCPhhFkC1WWX5S3BdpI3nCU5qT5eERBUriyuO3p5sYkNWettx
	o8MFBaU782F+joAGWAO4vlbfFoveRpSJMgV53ByHW9pIAQKXtkk4NpUls0XRELIASLYf9CMI8XE
	K+IB8D5ajyajjf+WnbUs5Q6QoJS1RVdA9rOCjMLzaSEuVI420N4ACoXicwmQZOjoXbN2SuL2Us5
	Wcd3s4KsQYX1NdnZ2PQ3iNIdVDkHiWTXTqgfxnsT9gxF8ILYQIY/Q3ykoAE0gSBIoUxE1WxxuYH
	JmGPFBv9lqEZ79FJtaJkD0zGDIzz55TCc/PxNZXbU4VHloafMF4tW/17zhe8wosvybSJE11dShL
	MdWXFTBEogn2kQ3vUeua1LFgRnIAC/i8UNflDwHbdIZvGe2MqjAiuMu6UewnqPNHTn6doUdXRvt
	yPsB43leGTFx5viC7ynFQcdOWuqh4V1aC+BT0qtAj1YEPbVwsHygjXURlf9lg8UgFnLTLx22nZo
	zotD4HzsIijDbExDXM5gD+dxJAiaOlI7Cqk=
X-Received: by 2002:a05:600c:3115:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a1fdaf7457mr119190055e9.9.1792686582353;
        Thu, 22 Oct 2026 09:29:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:211e:45da:8a88:2665? ([2a01:cb1c:fcf:4600:211e:45da:8a88:2665])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21046b92esm6567865e9.10.2026.10.22.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:29:41 -0700 (PDT)
Message-ID: <cc5fc382-a628-49b7-a15f-355180c10312@linaro.org>
Date: Thu, 22 Oct 2026 18:29:41 +0200
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
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic Meson
 SoC CLOCK FRAMEWORK
To: Carlo Caione <ccaione@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
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
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 17:57, Carlo Caione wrote:
> The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
> GXBB and Meson8 headers were the only clock headers, and only the A1
> ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
> and T7 clock controllers in include/dt-bindings/clock/ are not covered,
> so ./scripts/get_maintainer.pl does not return this section for them.
> 
> Match every amlogic,* clock header, and the axg* and g12a* ones.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..e5bda99b3015 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2555,7 +2555,9 @@ L:	linux-amlogic@lists.infradead.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/clock/amlogic*
>   F:	drivers/clk/meson/
> -F:	include/dt-bindings/clock/amlogic,a1*
> +F:	include/dt-bindings/clock/amlogic,*
> +F:	include/dt-bindings/clock/axg*
> +F:	include/dt-bindings/clock/g12a*
>   F:	include/dt-bindings/clock/gxbb*
>   F:	include/dt-bindings/clock/meson*
>   
> 
> ---
> base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
> change-id: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a
> 
> Best regards,
> --
> Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
