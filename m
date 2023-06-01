Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41273C77B7E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbjFAKEt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbjFAKEW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:04:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D0E10E7
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:02:45 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3b314b1d7so678423e87.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613763; x=1688205763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtIhHmWw9D14wrf/eU/kb+jzf7bSN8757m3wTAorWec=;
        b=RNeR+YrQJRkOpXzZ48pZYolTrZGJ9F7RLqNmjrL+3vuv5xr12Jl7hUWdQfZ/pGx+nL
         O6GSqgJFrjftwZismXJ7oGal0YD4GldrdoN68+LVRluxutZdj3yJlin62Tpt8jyS5rdH
         KMKTi4EyPdVlJ6y3Za1dGSUYw3HXOpSn2aXP/kjI+VShW7plR/8WP6CI0koeZFI4YaPy
         whp/NEF9Oe1puJadtnDiH5cXb7sua71jtJkx65SH8GE7O4pS5+CVmFsZ8oqtBZjmK6Vp
         LUaX0qKGuuCRCuVbOLJOe9MwdWQY3LPaCKLr4FjdV3JQ8/pgl+wkpupKqInFPfKajJu7
         vJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613763; x=1688205763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtIhHmWw9D14wrf/eU/kb+jzf7bSN8757m3wTAorWec=;
        b=JszMFUxxwT7GT25VZyN88kQOPuQZOgs/81uq/5dZvVE9EqKq+20GIja7nihINLhaS/
         ur0jGdAxedW6zae2hYdE4cRr9FjaScCnkJ828nBm5ekcd3s+Cn9XxKyxbo56zkukzkUv
         T3cCHTFVnBeY+CabMO+Fp+OY3urmhABD0+0FdeK2cHYV1fujCjmb0oQGSpeNHoYrgDoZ
         o6fhvKByX+7j1u1UOnfx2Ch2dzbSzmtKktfrZoh9V0C3/6Y/H1i5UEjwrukRAJ5dNmue
         VIPD2aASlmzDNEmdYpbd4aHsuAXTW5gWCL6xSC5gkx0zbb7sYxyl1nvh2H/Q2xfsdntk
         v5Vw==
X-Gm-Message-State: AC+VfDwRfqj8wOPQAb/h6uJxc+tJIhCTTi0J04rbctUn62lwVF36y7i8
        YbL4Y8KzOgu+6O3M5FXoYOO2pQ==
X-Google-Smtp-Source: ACHHUZ5vkVgYyQdQPP8DDZyOBqbnNkzBIs8iF+i8uT+qw2Un5A7OLMs9AycBniPp1qekCbNDY/LnMQ==
X-Received: by 2002:ac2:41d4:0:b0:4f3:af46:1941 with SMTP id d20-20020ac241d4000000b004f3af461941mr922531lfi.34.1685613763467;
        Thu, 01 Jun 2023 03:02:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j6-20020ac24546000000b004b40c1f1c70sm1035387lfm.212.2023.06.01.03.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:02:43 -0700 (PDT)
Message-ID: <dead82e4-62c9-9d0d-0e02-b3d0f8b5c690@linaro.org>
Date:   Thu, 1 Jun 2023 13:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/20] interconnect: qcom: Add missing headers in
 icc-rpm.h
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-9-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-9-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> Currently the header does not provide all the required dependencies.
> Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> index aec192321411..09abdd0c891e 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -6,6 +6,8 @@
>   #ifndef __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
>   #define __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
>   
> +#include <linux/platform_device.h>
> +#include <linux/interconnect-provider.h>

Alphabetic order?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   #include <linux/soc/qcom/smd-rpm.h>
>   
>   #include <dt-bindings/interconnect/qcom,icc.h>
> 

-- 
With best wishes
Dmitry

