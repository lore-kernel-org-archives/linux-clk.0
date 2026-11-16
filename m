Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814826;
	b=bOXiJcH6hyOolL3Eec9s/Rsh8KHtJl/KB6EEXEIL8Aw7D4OPyQffKObCKklqVUyv9N7T
	 Sz2z5Jh7NjM4gVxjhLgxnfE7RZnV2ByoRTqpbydcqK3rACqsJurypa3M0YnQD3WYPnIsb
	 4AEOj5+2js0Ez/W1xk5lhNLdFkgLKYMOyO0k1Y/Ukpap63lAuk18/2P+lLJS/MKwONuNc
	 5qqMMIYuXYmtDKqoeBymCxmFVz0wNTZS0UdXFMED/xmGrqKvV2JK67akI1RwkXuOer609
	 t+69rd514WMAoVH2UZUzf7WHhCp+hMmd/l/Aii9W6qnV8LnxrQhshSAQssgvf/GKfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XaIebkWcz2a8QcsRqGjnVGOPQYVk0phRmVCTzZlFBOY=;
	b=tN1heVZzOA+hv96de6SeJDCrMp989xsizHQSVTvDKnqMmPvQVfPOXwiN6ZiJvxFTsTkP
	 wpogRgrYigHp8mnoCiKf/v8oIk4FveOLFYpBXxB9vxt4Rg6OY3gD7OcfnY/1IdSqutLFK
	 fl6JXayRi27m+MwcGLMPGvVRtRbh5tno7ty1PeArBDNwL2LBmDWDcJ8k9eVAenmoY4i1K
	 c/xZBsusyaFbl1kYYGYPpTbv9uwkyserYQxj9gSgVLemJXcvwDESx4s27/sqCEyDFwEyJ
	 Ed7lOvpJ9iBmzGr207z6zXtRWo5NNEn+hbBTNMCpKd3GO6Vg8ZhE2PGTbfa9ZhcaOXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xsyJMSsV;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582A60A5BC9
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D582A60A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xsyJMSsV
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49d64a88222so1179964f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794814824; x=1795419624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaIebkWcz2a8QcsRqGjnVGOPQYVk0phRmVCTzZlFBOY=;
        b=xsyJMSsVQKSoUONdPaX0yOCY4hbLYZiF3aTqxT6HWl/nUY/GUdKYFKv8BXWpz4xVMU
         am0Az4ZEMKTvJuuFDTuSoXS94GlJqUZOXa9rC5BTni9yTokJoCJ6xUXdZ5zj7mXynoTE
         8UHF8fFyq6nxfIKkb8LyiW8CC3g5kncEPteyCEDJS/oFPbAsdFzNZqI/Nyn36YwrkWGM
         cfhbKubicV1UgA4EeoyI+Tt2MLkaELKwtnWeOHw3Lyn4KMFBoyY6GdNCZR+Lkz4f7Xhy
         ATP0ZSngarjg8alxPL3nuojNpKh3cGZ+nH9pNOpkKpA55TzlLGOFfhYydGF6eE6hdUHt
         KZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814824; x=1795419624;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaIebkWcz2a8QcsRqGjnVGOPQYVk0phRmVCTzZlFBOY=;
        b=ErGN9rrNN2pYSty2zdFCQDIHt/hnExL3+HOWNZ2IVUhLRh57N+FCcCFr4a429L1R4D
         DG5xueM6LkZt80pxU/30/OSp8ehZjgNfF3BrAmOwnzsBIJv4UsVgNE8jqJaI6b6ymplX
         FacJz9pTWmcmV6nYgNRzVVGoJUGifildJAtIFiOauFywv3PGAgIFMsOYdLo5oZAkFKmI
         J6GKKembHj5+nHiLtinEMkQfHjTXRKQTutcaCmLLn9WDw81Yu3TrNCOC5k16648tU+Tc
         Z8ofE0qVrriaFclYvaO4KGHtHU6cNNpP4vD3VLWW13etkiLI3K8IvmWqtLp+2lUUprOd
         JutQ==
X-Forwarded-Encrypted: i=1; AL+hErF4S+DePcAY9zhM13DbwNN8l0LYo4YcXR7ntjYVQzziiXFePkkUUnQkwxC6fSHriPDAgRHYWe0LtM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uWmrYqWHnFY8to1/XBA/AEX/uKjcB32nX9tWTY44QSdTV6LfB
	XaZI59u8XN7HYQVQiQquwddLzKVmtuu1hdx4btVAiVki9tXgNsI5SJ2Zd8cGa0Mku9k=
X-Gm-Gg: AYBFou17JqDuJkrRY83ZMtnRDvxx7UP3FDxQ7eWu6KkJ1vDvsD71Tc+TKHuqITtVmjI
	jofN1ieE5WUByeUXJC9ZF6ZcU9tqQAdtpe3L/rRYsD4bC1Uy4M+qaBhcF+YzdtViyrqW54SG0iQ
	8L84hVkp/tXVenDfHkYQndzukLOA4GRXeuFps91oKmPyR5HjmjfwspcAvXQ+kPVfBzty4K9hcMj
	weiu5bsqVcLtydrFlLppczQiQSmrqiyuoPKuND6/4pFpgg+TKxd5M55Xsh76lHPDUR/Zads+xmb
	TPmOGZpDEoGhjsJD7SfuHmDL22czaOI23pj2nVKYilU7l5qAk8WbBylL+M3v8miXdMUZFcVeSfb
	J5ufOp61QEmGI9O9qSLp6AIDLEW/Hh6CCVq15UpzRBZLXPfci/h5qikzZWUV1HgqLwJVczvoT6i
	Q3/GJ+u853t+cg4b5hT40KYK6ZZvbYlY3fCP+LTuRi3oonQbp0NUHnDrIcnW6dN0E/EkuiXHn1I
	8PSwM4a4JJmNn3QcK+ciSmLa6kzHmibYy+ofoq0IVBrRkSzNqboXkNak26aQwzDUSmCF25r9U1V
	+KenRne5qkW5A1reuJZECzHy8Rq6dz6+/e4AMnbKWvhCnCtlQcsvbKFIWiL65e4RnPdUc44lXdN
	cbIwlPR9r
X-Received: by 2002:a05:6000:250d:b0:48f:bf71:2aeb with SMTP id ffacd0b85a97d-49c70ed8f89mr23615064f8f.23.1794814823845;
        Sun, 15 Nov 2026 23:40:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm20080240f8f.46.2026.11.15.23.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:40:23 -0800 (PST)
Message-ID: <38c038df-caf4-41c3-8899-20a3ffbd28c6@linaro.org>
Date: Mon, 16 Nov 2026 08:40:22 +0100
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
Subject: Re: [PATCH RFC 20/23] arm64: dts: qcom: sm8650: move EL1 Gunyah nodes
 to sm8650-el1.dtsi
To: Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-20-5183f6aab9fc@linaro.org>
 <f5bc0271-5ecd-49b7-aa5b-d5742bf2fe03@packett.cool>
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
In-Reply-To: <f5bc0271-5ecd-49b7-aa5b-d5742bf2fe03@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/26 20:08, Val Packett wrote:
> 
> On 11/13/26 3:38 PM, Neil Armstrong wrote:
>> The reserved memory map, remoteprocs, SMP2P, IPA, GPU zap shader and the
>> q6prm LPASS clocks only apply when booting at EL1 under Gunyah, and
>> boards booting Linux at EL2 had to delete them.
> 
> This might be true in practice for this specific SoC just due to these being the only devices made,
> 
> but in general, "boots Linux at EL2" does not automatically imply "does not use smp2p/remoteprocs" (see Glymur; and earlier laptops with hacks that happily use ADSP under EL2) so the dtsi that includes all remoteprocs being called "el1" is quite strange IMO

Yes because the early boot loads the ADSP "lite" firmware for USB-C and battery management,
which is not the case of other non-compute platforms.

And you can entirely not use the DSPs on those platforms as-well, all the nodes
I moved are entirety Gunyah specific on this platform since when booting
from EL2 without Gunyah the firmware interfaces to load the firmwares,
setup the clocks, power domains and IOMMU doesn't exist.

SI instead of el1 I could use "gunyah" ?

Neil

> 
>> Move them into sm8650-el1.dtsi, included by the EL1 boards, and drop the
>> node deletions from the Deckard dts.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-el1.dtsi           | 775 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   1 +
>>   arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  21 -
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               | 774 +-------------------
>>   7 files changed, 801 insertions(+), 773 deletions(-
>> [..]
> 
> 
> Thanks,
> ~val

