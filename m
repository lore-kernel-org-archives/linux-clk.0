Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jj87tb0y"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756C69C
	for <linux-clk@vger.kernel.org>; Tue,  5 Dec 2023 00:28:27 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c0873cf84so26531695e9.1
        for <linux-clk@vger.kernel.org>; Tue, 05 Dec 2023 00:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701764906; x=1702369706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFKSpKSrRWoXFYENkiq8+HWQ5Z6F7TKJoFhiU9QOe50=;
        b=jj87tb0yhpvjQKFErmqoHFiIwd/X3gUIJbAXGvUotknsnKn7Ummb0N33E3nz0DoSXV
         93JS9MIC/5bbf54TgNWhh5nl6WfM1HPHUrZazbpVHww1IM4gYZbZPiMz9+uYzHZ7cacs
         XI4SnJI4YG6ununjPSY0nfMYQPddg9swlboQfLDc47EJVU5tSPyphCcIsB7lWWuWozfl
         +NWwqMc6rgkBp/XsS/rfilb/4hHqiZyWo8Jm4Cy2ZFTLG+8IwbW6g0LNda9qltlz8UqS
         2hBGrb8d98XKM7HSPsdS9cRj/9JCBQxqF7fnoOwB00csDIbU6pw9K7n6+yhcKfR4BR8K
         TetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701764906; x=1702369706;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NFKSpKSrRWoXFYENkiq8+HWQ5Z6F7TKJoFhiU9QOe50=;
        b=C0KsMxjioBByqOYSOzPwcN5Bejiir7NfojrrZ9OSO8rRLra0UiIBt2yhJXNQbm+pO8
         zRGJ42IX5rDqghkmOHtRamrrp3dvHJfIJPaGn/JrV8zcJrA6tr1MfoTh4TAsnJ24wmfK
         VKmx0PPxHig6x3BVVRXcCnOdJzsihcA4+nErEUZpGCJ75ILEZ8qEXLQkLJAz5bZLxIOK
         YqXR99/GxkCfX9Oy1oHtFNdVUDKGIba/U4gRGcLvyYKNQ5ato+nVH7dXiDoK3SgY+0RN
         LHDbsfM9nx3ByMRLvbZVsHn/aw9ek3QOpDP71q4GCj87y1A+BMfYAOku7reghVykg9LD
         5e3Q==
X-Gm-Message-State: AOJu0YziC4qduKNRm1pRck568On9GwM84ig/XCGACjZJYC33WFLoVdzL
	tkgH7eCYaig+DyonvLCpwZ/QKg==
X-Google-Smtp-Source: AGHT+IHYiYh03gF0HR7CFXPhKVhJzy9KsD1yiXJ0hCAKQRDxLuSaDr/vOiQCjfOHYK/99proMO0sbQ==
X-Received: by 2002:a1c:7315:0:b0:40b:5e21:d341 with SMTP id d21-20020a1c7315000000b0040b5e21d341mr254803wmb.74.1701764905895;
        Tue, 05 Dec 2023 00:28:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb? ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c358700b0040849ce7116sm21619517wmq.43.2023.12.05.00.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 00:28:25 -0800 (PST)
Message-ID: <f93acb2c-0871-469e-9744-60e52f4b9918@linaro.org>
Date: Tue, 5 Dec 2023 09:28:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/10] rockchip: Add Powkiddy X55
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, javierm@redhat.com, heiko@sntech.de,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <170176481258.4073725.14793788958228896320.b4-ty@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <170176481258.4073725.14793788958228896320.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2023 09:26, Neil Armstrong wrote:
> Hi,
> 
> On Mon, 04 Dec 2023 12:57:09 -0600, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>>
>> Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
>> console.
>>
>> Changes since V1:
>>   - Corrected a bug with the DRM mode flags for the video driver.
>>   - Adjusted panel front and back porch and pixel clock to fix
>>     issues with display that occurred after correcting DRM mode
>>     flag bug.
>>   - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
> 
> [01/10] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8c2c5d1d33f0725b7995f44f87a81311d13a441d
> [02/10] drm/panel: himax-hx8394: Drop shutdown logic
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e4f53a4d921eba6187a2599cf184a3beeb604fe2
> [03/10] dt-bindings: display: Document Himax HX8394 panel rotation
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=be478bc7ab08127473ce9ed893378cc2a8762611
> [04/10] drm/panel: himax-hx8394: Add Panel Rotation Support
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a695a5009c8fd239a98d98209489997ff5397d2b
> [05/10] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=00830a0d8f0d820335e7beb26e251069d90f2574
> [06/10] drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=38db985966d2f0f89f7e1891253489a16936fc5e
> [07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
>          (no commit info)
> [08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
>          (no commit info)
> [09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
>          (no commit info)
> [10/10] arm64: dts: rockchip: Add Powkiddy X55
>          (no commit info)
> 

To clarify, only patches 1 to 6 were applied to drm-misc-next,

Thanks,
Neil
