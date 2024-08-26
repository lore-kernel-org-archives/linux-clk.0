Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97463146588
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666130; cv=none; b=W5YcDSEJ5S0oxUc1TG1pfThH7bHOXto9rYtHPyjzNrjCu5m3S4tQz9zukZSvp0Zs8RgWYUs9wFgSq1fDwptYf2chgWRMOM6yjAxuWgs0tOiR7UshEvEDyaBnVjQ/Tey8Fn1rtzDRZ9ZXBRdZsqGZqPxRbWnMSdlZrNVYPm+lN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666130; c=relaxed/simple;
	bh=5j3I46k6ptwrT5KLfjuvRJi02PLBHAdj9fxSvDP75Io=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M90mSa7sIolZaqSFXB/dIXphz1aHIB6YF5X4lt3ylmFyiSZ0BzqK/l3Yb0dy9stdTztbIk2JD5s4tGspIg7D3FJfbi6Rpgq275zrtixsNj/jZ/5kS+QlfqHni/kZ0eJsPeOgI51+ZC5ou+Y9Tg2Fro7x0NxC0z8dklr8T/OSpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZlBbLZx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZlBbLZx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3718b5e9c4fso2107092f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666126; x=1725270926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VK7ceKk9+QuKgFb+l7lbOmbbJTuc/8ZMI5BdFql0QbQ=;
        b=PZlBbLZxOX3gpM73VWcHaM6ZQ0dCrvBmshz9RzkGx1oxPQbtj7Tss75dyAa0gaImxc
         7fafDjKPTVF9LYCncGZdxcXVYC/+pdWvjfOHyxShQCdcc+qPf7r3iWTqyh7AR7719A4v
         cCARfs2EfSRdIMl7D7xYNy0/50ovtWLbl5W5HjSOcuGsjKxskVGyHWgb2D3kaQOkER5b
         FaM2yNOs8XoF1iKJvDAEq2DJVw/R7Ur9sQtjH7hz/6mKIyIomnHQSDKTXJ92nFq8nZcC
         EnAVidgpBbU2HqV+fCuQYsWDFdDDOVm0lFpT5P2pGwE7sb36pn4pt0oXJHOX82yVQS60
         SICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666126; x=1725270926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VK7ceKk9+QuKgFb+l7lbOmbbJTuc/8ZMI5BdFql0QbQ=;
        b=Bhn0x6vmadPLOggQqKNfAv3NsZYWq9h2EK02tOLrNeIdOJNIv/FTaTWgVt8domkAxQ
         fPaZ13XXlSDqm3awmqjkmjFm57RZeWRQt6MrZ5vMCpaRJ0Y9DMtP9FDK/73MdSb6H4+m
         5TdLC3ZYvO4/JR6VRHAPHtXQEVX88VBZdQLg7BdHz6BnMDkveN7ug35+PW4Qtixceae+
         nzA4O/TOOLgGhd65rIvBzV7saD7mBGl85ZOvi6+1zT7lH5GNydnWsJGDEdSSHkIhBmWq
         H9RtRiTodK5g9EsfBzDkvY6EUeOZzuqpuwfe0C4LrCA/Hwy1eBwt1wnEzcBHogXLQ6AD
         /Icg==
X-Forwarded-Encrypted: i=1; AJvYcCVHnQasp+sstcC8XNxCGiXxEN1jl9gc8+p8Xe55ipQtLbQ/ass7WvS97GqQ8++XyFYpEgL7DEldS6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzaP8UuPPTSogQkscPLkVhTTYz9XurgvZ60EvaJ+PWhAhPfJkv
	tM8mbO+Siav56UVVHCYwpSilvIyzqC//N7orErN6JjxuxbL6lm4bMBxaWpkV7x8=
X-Google-Smtp-Source: AGHT+IFreUR3/E7uHdXTquMSkJpFO/dW71VumcJUcTwCvc9tqzIioKTR8C4yLeHdVUzlxat4VoCD7g==
X-Received: by 2002:adf:a209:0:b0:367:8f29:f7b6 with SMTP id ffacd0b85a97d-37311919579mr5512128f8f.51.1724666125502;
        Mon, 26 Aug 2024 02:55:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7355:c4a4:da66:6d71? ([2a01:e0a:982:cbb0:7355:c4a4:da66:6d71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51860e8sm147572485e9.48.2024.08.26.02.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:55:25 -0700 (PDT)
Message-ID: <c6fa1da6-c244-4fe8-9ef1-dd2c9b76f2f9@linaro.org>
Date: Mon, 26 Aug 2024 11:55:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking
 breakage
To: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 patches@lists.linux.dev, linux-clk@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>, Taniya Das <quic_tdas@quicinc.com>
References: <20240819233628.2074654-1-swboyd@chromium.org>
 <d03d5425-bd7c-4c20-a54e-5708ffd059e0@linaro.org>
 <CAE-0n52=kQzEx76D5AmZfui_X0jqejQ+ENz+VQunY_ovph65Hw@mail.gmail.com>
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
In-Reply-To: <CAE-0n52=kQzEx76D5AmZfui_X0jqejQ+ENz+VQunY_ovph65Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/2024 22:33, Stephen Boyd wrote:
> Quoting neil.armstrong@linaro.org (2024-08-21 08:44:00)
>> Hi,
>>
>> On 20/08/2024 01:36, Stephen Boyd wrote:
>>> Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
>>> Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
>>> These two patches fix the issue by skipping the parking bit of the
>>> shared RCGs for devices that can't run so slow.
>>>
>>> [1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/
>>>
>>> Stephen Boyd (2):
>>>     clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
>>>     clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
>>>
>>>    drivers/clk/qcom/clk-rcg.h    |  1 +
>>>    drivers/clk/qcom/clk-rcg2.c   | 30 +++++++++++++++++++
>>>    drivers/clk/qcom/gcc-sm8550.c | 54 +++++++++++++++++------------------
>>>    3 files changed, 58 insertions(+), 27 deletions(-)
>>>
>>>
>>> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
>>
>> I'm pretty sure sm8450 & sm8650 (and probably other SoCs) could be also affected, could you check ?
> 
> Does someone have the hardware to test? It looks like sm8450 isn't using
> the shared ops, but sm8650 is, likely incorrectly.

I can't reproduce the uart issue on 8650, I'll try moving some dependencies (CLK, ICC, ..) as modules.

Bryan reproduced it on X1, and he posted a patch.

Neil
