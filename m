Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BEAE9413B
	for <linux-clk@archiver.kernel.org>; Fri,  6 Oct 2023 23:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbjJFXu0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Oct 2023 19:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbjJFXuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Oct 2023 19:50:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BCFBF
        for <linux-clk@vger.kernel.org>; Fri,  6 Oct 2023 16:50:22 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so3490042e87.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Oct 2023 16:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696636221; x=1697241021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hu3bT/bg5MKS5nmmxKBtPj+L+cYk6yo/9FATsBXH5cw=;
        b=Q2aDheJHgY9rNzmLrEsttfsxEM5k5KztOuuMAcx2M6WduuDJbm4RPZy40PrOiXuN8o
         7Cwyk4e9jdgBvJNeM4BUh8s2UaRT3uW0+ZiWAsxvOVXM4y1fMhewVWZ9a3BoKz28L9dv
         PTjtgX83/TtMK/xMUJUXh8gwafRpGo8trmDtqXsyf6vfQZuGK6CfjGORsL5SZZNfmwSy
         V8WDqlvkLzl36upg+Ze7neCkI1CUHpGMSDs9ELFiC/IBNSWXNQmfglSxr+JbI3fPbUYw
         yBaOgif4Gp+CcESe1aOwf/zfve96aXTmKwHB1BMYvl1javV+QNalX92nKF4lPs0XSKuA
         pHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696636221; x=1697241021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu3bT/bg5MKS5nmmxKBtPj+L+cYk6yo/9FATsBXH5cw=;
        b=F6BpBc9n5vty8TFGGFWOhBD+hVESpxArVmH+JyiG9poavbsYCka6jSaIu/s6ZW2L0u
         DJP/KmQRDKCh+k/EDPI/xsuxq6urmaUj5e8Fp+qOn+6z1G9sOHPHDZylbgrBFTsLH1aN
         SVLl/pHOwCa9Z0mFFhlkHRw53XjyKhwNFy/LBJx2U1x8STgzvO2G7nH6Wig5xu0sWGHs
         8nJ+PlIvXTRj9AmoIJWKy8G+IwNHWo7lJKydAy2p+X3I+3XkwZ9wkrSO3fBgMn9F6anW
         Szccku1zwOFBP2/0ebBc0eSnmDj5QbCsiouK90lni9jje54Y27B4AWfY0AGmamB6yG0D
         fh+Q==
X-Gm-Message-State: AOJu0YzJRnFHAsi9EouFiaip7gEaBPwBwQZzXX6LjVlBtqgI5Nq1V+Bl
        5UTLhjfO0VXzQBKXsdtHIzYhpg==
X-Google-Smtp-Source: AGHT+IEs2MGl26fIACYsXS5dfGGfgG3l016KrHdttUNgYelmOFhZfjkW7m6pNTxusAGP8lKywcXNIw==
X-Received: by 2002:ac2:44af:0:b0:502:adbb:f9db with SMTP id c15-20020ac244af000000b00502adbbf9dbmr7680338lfm.65.1696636220713;
        Fri, 06 Oct 2023 16:50:20 -0700 (PDT)
Received: from [192.168.200.173] (178235177147.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.147])
        by smtp.gmail.com with ESMTPSA id u7-20020ac25187000000b005047bf13b6bsm480681lfi.42.2023.10.06.16.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 16:50:20 -0700 (PDT)
Message-ID: <0eebfc14-dbcd-4987-9e94-ea5630b6c268@linaro.org>
Date:   Sat, 7 Oct 2023 01:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-msm8953: fix stuck gcc_usb30_master_clk
Content-Language: en-US
To:     =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231002170021.192740-1-trabarni@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20231002170021.192740-1-trabarni@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2.10.2023 19:00, Barnabás Czémán wrote:
> According to downstream dwc3-msm source this clock has FSM dependency on
> gcc_pcnoc_usb30_clk so enabling it would fail if latter isn't enabled.
> This patch add works around this issue by changing parent of
> gcc_usb30_master_clk to gcc_pcnoc_usb30_clk. This is acceptable because
> both clocks have same parent and are branches/gates.
> 
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
"meh"

There are multiple cases, especially with qcom, where there are some
magic "dependencies" without parent-child relationship. The common
clock framework doesn't currently have any good way to handle this,
other than some mind gymnastics like you had to do here with matching
them against a common parent/ancestor..

Stephen, what do you say?

Konrad
