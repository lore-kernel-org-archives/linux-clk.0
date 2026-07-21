Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA213254BD
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651737; cv=none; b=rjb1xjLlHOeFwPMo0ouramRARWUi72VXV2gLVeaydt2F3vEX5eBsI57dLZNd/1JTUJ/JPF7Zjl/BrV87AwBrh4nInvVrLJP48LdLoxEc3WrANnbeQmEWx4EtmRpfGPNF7xczAm6oWm0lQfpu6n0GfwLs89Fzw1sOQShiuBCdja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651737; c=relaxed/simple;
	bh=uxWFp29cQ2frkqcvF0LDf8QBVjMH7JZLS0lj7F0LpTg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=oL/14HjyobgsO6GW3XAUVSpKRK1D3WTHRTfCrO+UjFiwi5TSa+Q/APSuz/rszKLT5k46hyc6KQ86BPsJ5UjUtfQrUzdulUTmOd3UfTGW33nOFI/Kb9nXLrAuWZN++1YIezUcv6BQ0Z3h5LzXoxanxueAOk3EhecF035tg6Kl5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I6f1XnHe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I6f1XnHe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f6de72faso36013725e9.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784651733; x=1785256533; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKprdM3FJ8Y0l9QeHX3vW8ynrIYTmEZdf02qd2O/TJU=;
        b=I6f1XnHeHDaYYLDyZiJSrQPPtj7kp+/FncvQh7TRTMbhXnnKcRmpiK3ccGbzgvn0OO
         2jtLyh8oGrjxeCMVlQnQf0uzSHoOknmTGBFOSbmpHV1T/aw0IkBHMnzQmp2nHNVGaYOZ
         TiB9axOivisM3FGrVpkEYzwqYPnwZI3wSoc7BjJwmvGTLBMUcKUp6frU/FVHltvVKCtX
         5XuymHNErMawcr3vJoR9xruitDDOynJb4IP08y23JnP/LFg+1tKS0tQWEYGUrfObn6J/
         FtzUhgh0g53dliCHQQQt0ead45gjXfEQ+Q7Ub/eJRakXJLBwz7pgD5SUbxLptj0sTHPi
         AG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651733; x=1785256533;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKprdM3FJ8Y0l9QeHX3vW8ynrIYTmEZdf02qd2O/TJU=;
        b=FGJHnvS5wOpRIoAcDmFu7VJfzLYPTvXjE/WlkdRsrA+HAgWyVCKfrSEWBMncjbjeWy
         ShKnUfyC8xhL4uJgmK/zwTpdgcLE3qQZSRJHQfK6RMlAzKHog6jblSKUJU1l2NvfErAs
         S+/t+KFTsEdMMhJT2t4NyKcyWPavb2lMMAC1GpgIA6H7mzTXhca3y5DOStuHqp33cuEo
         ym0AqOjCVAUDsCUVsB7I3PJM+PZxZQZoVlbZy91IQW8xWPqDGa+oMq321QkPFtxBoyHy
         M/rlA8hagtMIRJgY2bYz7KazXu9s85jA7dIDnKwW8/ar5/VAev49gbUjf5yZ0zm1I4oa
         R+Iw==
X-Forwarded-Encrypted: i=1; AHgh+RoYjLlXmKwK/Bo855+LLuVaVqUxLF4Egdvp8IGHaohpRKgKsCmisQmT78p1ZRYBfzC0062msH+sbjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKNSt/QCEE0Ymbvk18d2xC/41O1eOoGc5PzUe2io2t6iZRfo4
	7av260O4/3wT1qr4ZUIFZ2ukGQVIKthYL6W8pEUKzMS0HoFhagrJhBuQGzMBaSxbJSY=
X-Gm-Gg: AfdE7cnecLMSdRtLm6mTkkaPYC3ELDhowQq7EzNm922nQDAZ7/Uj0sI8rexy9uWV/TY
	f4gAUGHwvDfeqUtOSQn9sNmRk5EfrmSxWEFpAXEP7wAnSzzC3jsRFLLfL/niKXaPAaZExwaXBTn
	EeGvCdNb3YZ8tYHpB2IVuLqXLxpRfXnmhd7TuBRVnI98r7N0vusNE+hT82N0tPv2IUy76Ve7Bbl
	qm0DAghfa1MScEyVQh8NOKxgoHv0PzpRBiUR/kcPCG8dy/yYj2uWDaGau3Qzrspj4DzZMQTQMNu
	UgRKNrKTYC3ypNMw101p01frGDp6sKv9yJI5jxdL7KuYR6equEb/QAu/j6gyQdHbTqSFYPd81/Y
	9y4toEtZqAcveQ9p5hVjQ9Y5YvxPpJ6mULsTJ5+uhk5HUp8fFvUWK7wGtNmGbNawfvKVk5GKgRL
	Z+e7vMMYq2+PBn9ITb8p1HZBrjTLsuXBYYXD0yHKApunc2hxoPyZHP
X-Received: by 2002:a05:600c:154c:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4956a4f6532mr5460255e9.8.1784651733215;
        Tue, 21 Jul 2026 09:35:33 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a508aa6sm5288515e9.7.2026.07.21.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/3] clk: nuvoton: ma35d1: fix
 ma35d1_clk_pll_determine_rate logic
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260721021356.288506-4-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-4-a0987203069@gmail.com>
Date: Tue, 21 Jul 2026 18:35:23 +0200
Message-Id: <178465172376.2337945.14489744680090859988.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uxWFp29cQ2frkqcvF0LDf8QBVjMH7JZLS0lj7F0LpTg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqX5/RZrZv/zWZ8eAFZxuPYMmrc1olGchvnxvYm
 AFkTO2ieJGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCal+f0QAKCRArRkmdfjHU
 RZghEACMKP49aqMhPqFuQw4AA1no+9cYjzANJhrDujH3wiu2SdxeF6PyFfGiza5hNNP+GWfngVj
 ZSFGkc86YYdqqLxhh55eZ3PpFo07h63FhAzpAR9WwwBKlale2SAE/HJku9CsB0gw+nMIPhgwdT1
 y/AMNTpxUsR4LxK9kVvws4EFxeI9txcy3Y/SNoVioFqwXZ9q7x1SntfGipe+Z/+NAJtjdNGrsD8
 krj8NUofk70txfgjgtgQwcy5wDrPzumAL3XpjfWPT+YwtB4Yob94yyPAyk8L7MMZigkONrodY9M
 pWphgoUJf7ZDluD0Ci+B6/9YkyJq97Wn7zm/tBQIKri8tARZ8orIJtt9utXDu4nTEuWmKIGJaPD
 qjXb2lJS6T6JakxUvi5wKefAQZ8BHmI1ET405v9tNxLO3QukRJtcJBRH31ZhtQ+vl16DbjMFQqL
 v5dKXbAl3MrE9XYUipFB95tQucl5frBC+EA5l7YvGk8cZCyEPWQIY/suJU96USta26u+bdT7sE5
 3Z7V43AQe19fx0v6bJUCS2OFoVX4WNKnq908HKEC6//YLiWhsURALzQ2y4/o2wS0cGNhbcqHgAx
 eDONXsZiSXdGyyAersNhFl/h5zIV8CzC9MEoVVc7H8sAFrdYPEEzdgAEwJuWgbpAwEHeY5FmDDt
 Q7VijLEeakLldrQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 10:13:56 +0800, Joey Lu <a0987203069@gmail.com> wrote:
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> index eb9d69d2077b..c7c0dc91a012 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
> [ ... skip 14 lines ... ]
> +		if (pll->id == CAPLL) {
> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
> +		} else {
> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
> +		}

Small, non-blocking readability suggestion: since we just switched on
pll->id, re-checking `if (pll->id == CAPLL)` inside the merged case reads a
little redundant. Would it be cleaner to keep CAPLL and DDRPLL as separate
case labels, mirroring ma35d1_clk_pll_recalc_rate() just above, where CAPLL
is the SMIC-design special case and DDRPLL uses the standard calc, and share
a single `req->rate = pll_freq; return 0;` tail? Roughly:

    case CAPLL:
            reg_ctl[0] = readl_relaxed(pll->ctl0_base);
            pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
            break;
    case DDRPLL:
            reg_ctl[0] = readl_relaxed(pll->ctl0_base);
            reg_ctl[1] = readl_relaxed(pll->ctl1_base);
            pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
            break;
    case APLL:
    case EPLL:
    case VPLL:
            ret = ma35d1_pll_find_closest(...);
            if (ret < 0)
                    return ret;
            break;
    default:
            req->rate = 0;
            return 0;
    }
    req->rate = pll_freq;
    return 0;

That keeps determine_rate() and recalc_rate() structurally parallel. The
logic as written looks correct either way, so please treat this purely as a
readability suggestion.

Otherwise,

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
