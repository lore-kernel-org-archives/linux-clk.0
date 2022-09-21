Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3841BC6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 15:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbiIUPv2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Sep 2022 11:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiIUPuw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 11:50:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D8C923D3
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 08:48:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a2so9930197lfb.6
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dfNfQ/WHHv5bx3D+RgTnUZ4fVKImMkLUwy9dSYsV4ZI=;
        b=CDmDV9J3qN4i9riPSH+wIb8RFI/McE/mLSFmgYfB/gE5F7kdrl1NmF42wf9DSBeRwd
         Ct19uqUuy2FLnAbCNp1CNMh4/330+XcctKS0V+I6PI+WFIOsKZvo5lCamy74KsczQFZS
         3uKuIr/48msm5QHiZgpYrcT5MTXmmsjkYB6oaTVlrafKzHaWJ+uv8QFBGhPIYiRonj9w
         8A7Rzs09sLCakpZTS6WRyB2bxIgExnCPqs6DkxUIwoEQSAn4C///Mygs7lqMZdHS3J8a
         ds+no9LudlHEJMErjZyqkQk19Omjo8V4qRakUidEcKo2qvMYJbfnxGwbd4PB/n/eRlFr
         wpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dfNfQ/WHHv5bx3D+RgTnUZ4fVKImMkLUwy9dSYsV4ZI=;
        b=KCWO/zhWc5ob3zzBlAyZgVo54R6yll7bD1bKWCjnsnQHR9lYo9MkOgzX+PRqVTU2nO
         jzVXSnIteQR02o1QEmPCgxfrphCpaTZ8sJVn9A41ebJK65CEUxUY0iKkpGltCbPKyitY
         IXlIUa4qDNg7LSipIImHDk8Amg9XJ+iZIPQ9Nnq433G+q0cz2c8s53BNnUKzSnn51onu
         Ys7z71YZqBqAKoKlqM90ga1LV5VsMmxlDVRFz0LHdhY+CtwHNvlHymDFubQ62shc8LiS
         uPUa7Ci75VWjGNJBu2dGNkERQgtrfXZFc4WIE2q/fy4/YRDTi23DPHWbD/Nu9/noM9St
         aJ1g==
X-Gm-Message-State: ACrzQf3VUdOTe9u4NFxKtU6miOw7SVPWoik6ZGMYzbFbWv5EYq9T2gtN
        w/XGZlo3z/xw26JxbJ85E7QuPA==
X-Google-Smtp-Source: AMsMyM52aQHhQGHg1+wR1Bdadj9kbl+E7s+T7WEcsWzkxcaODyaGUchTnGQ0q6iJgm1jXk7j1PT/UA==
X-Received: by 2002:a05:6512:3503:b0:496:55d:a186 with SMTP id h3-20020a056512350300b00496055da186mr9957884lfs.340.1663775318470;
        Wed, 21 Sep 2022 08:48:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be36-20020a05651c172400b0026bca725cd0sm496321ljb.39.2022.09.21.08.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:48:37 -0700 (PDT)
Message-ID: <6ef8b2d9-2ffa-ff18-eb9a-9d7b9f293ced@linaro.org>
Date:   Wed, 21 Sep 2022 17:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: clocks: qcom,gcc-sc8280xp: Fix typos
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220921153155.279182-1-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921153155.279182-1-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/09/2022 17:31, Andrew Halaney wrote:
> pipegmux and SuperSpeed are the proper spelling for those terms.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

