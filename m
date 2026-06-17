Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2AA3B3C15
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683807; cv=none; b=agcV3mWsy48XZ/+YNl2twR6vBrBMj1M9LYN/8GBIp5r/XMYB59eQcAdXv+dqbe4uOVL98GO5BuzAw/LNOeB9adwqZp+nOfJX4XRlWUagQC/imaOtNgXjx57ccqeYaMJRWxn0d3CHahk1Mg+vvbzpkFmyemvTgi2B2Ia4HflS9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683807; c=relaxed/simple;
	bh=xwvy2ZcXRdQVNsdvURg5djpvEAjHUGBfx+ulYsnHkXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B12uIMifI2+ESv2AnBuZ7/yzjQZ8jaEgHI76jdj0Z+MsICDRwkZcCmGISY+AA58YhewCy4g5mt7dEgrpMnv2NzPgzPZI6eeaC0pspCcQQCEijxGiqmMpSlLw5j6dxnwvj6mFGDpRJSWRToulIjW2CSI2WQP+WkLC6T8iV1MwdaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCoTvWIz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCoTvWIz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4626fdc829aso402218f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781683804; x=1782288604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJVNCdcKD4gEI2MuivW/VCnurJJvnKmFjFb94f74ebs=;
        b=GCoTvWIzzLU5hSaEuQ6lsrqcRPFAfOWfFU/o2l9cM4bsZ+o09Vcm8nfgK7fYlJDhvh
         pYjmXZgU+71or1S68XsgtCjFsngKByfdU83dGGYCZZTBqTrQzoB0fZ1zvhPfURBsYqsK
         Wk1djoG3eaBSTvtxFEpTMKjjRrXR9Ckl7ZiTq06AN8nznmxwNAQo9LcUyZQjNZ9PYXJd
         2Da/qfuDlMC7tpbyjWW/XK1kfSkCTsgsQ3+erzstJRX2I3nrz1ofdTXSMp/jstdosZfR
         LwYsGZvdO4A12fu+An3r6lNFm7WPf25EbS0YqRVnvuyRSjce0JF8g02IPGb8e+kvCN3x
         hPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683804; x=1782288604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJVNCdcKD4gEI2MuivW/VCnurJJvnKmFjFb94f74ebs=;
        b=P6c2L1XhKgK3QBXbshcK83osZF4UBCAGVLnPEMuaXmjEyinqWV4mx0FcpCfeO3rUWM
         2sdWoWhfW9OV21aJ8PlRSHasEa8z2tV6b8y7ia4SF01hTPlvTLwgMt2Hfm64aZ3BuRiy
         iYuzZRGz+RHbhgml8HaegAq5dNH7Aoz/3Sk2l/cEAj+tr/AByA5a4+i0Du90GidTuA51
         u8z6+HNoM6q6y8X3I/cuxL5NCGpLmJF6eO5Fc4dxK6BFouMjL4MYQJwI70SArJuCjAoN
         y0bcfUOw4Up3BS45zLP5uBBR79SNLjnTZvBv6nMrvoLkrK1FfcLKBCX5qeELWwOfdswa
         vvlg==
X-Gm-Message-State: AOJu0YxzU5FzBGhyeeyqpA/dlV4yi2vmIue64LrthqmzXxpXidvcGceN
	TRrc71+QUtzfzIT6Bx/bBSqvoCQcIr76Fg+ctIpQHgqAEvLlEBb3gX9w5yr5WBtndNQ=
X-Gm-Gg: AfdE7cnLNkaUZcohNV1ey/PqzZ44/OPsnVrqgvRjM1j4PESLjFwJwSW04+X0NNXvMxx
	Y1aV1tyIFLQhBFsuVjYcZFowzpI5ruTutlHp+EMXnYxy6tIgYQk1ObK4OkGtH2M7r2ZVSevmTWs
	lzYwvFFWfalNJhi1Jwxqvc05C57gcpKKpUrzgQdIFXxNOD4+HHx7HVPUvTj2m8wbAKwBte0Bqtb
	bWqQdaCkF8+YkpAs4R4G1SOU2gLTWaBohJXFaGVz3AIvMuPisj4XK71x3Fuw1i2yKTmjHZMMtLN
	bwrL8U6i56QpX9Jjo4EwBidarutIGYP46rOGwAEi9awEWn8RqDM6l87HMkZnOW6asYSrJxuzwUJ
	+Hdw3o+A930c8REa0075nlGKl2fhoXPyjwFeFL0B5HoEKpcQ8aW2uIqWr4ndgyQNi2bcmDzwCNr
	TQx62rViVYrBaZBFpdrflYLw==
X-Received: by 2002:a5d:588d:0:b0:45e:d3aa:e45f with SMTP id ffacd0b85a97d-462416a2b3bmr4312960f8f.28.1781683803754;
        Wed, 17 Jun 2026 01:10:03 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm53999576f8f.11.2026.06.17.01.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:10:02 -0700 (PDT)
Message-ID: <16314a15-2891-475d-b6c8-591af87f1330@linaro.org>
Date: Wed, 17 Jun 2026 10:10:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/5] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/26 23:09, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series:
> - Adds a generic clk_sync_state() callback that's initially empty.
> - Adds a generic qcom_cc_sync_state() for qcom SoCs that need to
>    interact with the Interconnect framework.
> - Converts the 7 qcom drivers from using icc_sync_state() to
>    qcom_cc_sync_state().
> - Implement the framework-level sync state via clk_sync_state().
> 
> This approach maintains bisectability.
> 
> Changes in v2:
> - Split out clk-cbf-8996.c into it's own patch, and don't call
>    qcom_cc_sync_state().
> - Clarify comment above call to dev_set_drv_sync_state() about
>    the -EBUSY.
> - Added Tested-by from Jens
> - Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457120eed200@redhat.com
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (5):
>        clk: introduce stub clk_sync_state()
>        clk: qcom: common: introduce qcom_cc_sync_state()
>        clk: qcom: convert from icc_sync_state() to qcom_cc_sync_state()
>        clk: qcom: cbf-8996: add clk_sync_state() call
>        clk: implement sync_state support
> 
>   drivers/clk/clk.c                | 76 +++++++++++++++++++++++++++++++++-------
>   drivers/clk/qcom/apss-ipq5424.c  |  3 +-
>   drivers/clk/qcom/clk-cbf-8996.c  |  8 +++--
>   drivers/clk/qcom/common.c        |  9 +++++
>   drivers/clk/qcom/common.h        |  1 +
>   drivers/clk/qcom/gcc-ipq5332.c   |  3 +-
>   drivers/clk/qcom/gcc-ipq5424.c   |  3 +-
>   drivers/clk/qcom/gcc-ipq9574.c   |  3 +-
>   drivers/clk/qcom/nsscc-ipq5424.c |  3 +-
>   drivers/clk/qcom/nsscc-ipq9574.c |  3 +-
>   include/linux/clk.h              | 14 ++++++++
>   11 files changed, 100 insertions(+), 26 deletions(-)
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-clk-sync-state-c0539c5530f4
> 
> Best regards,

Just ran this patchset on the Amlogic boards (AML-S905X-CC, AML-S805X-CC, BPI-M2S, BPI-M5) in my CI lab, and it behaved correctly.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on AML-S905X-CC, AML-S805X-CC, BPI-M2S, BPI-M5

Thanks,
Neil
