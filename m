Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A67C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 06:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjESGPd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 02:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjESGPc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 02:15:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612711AC
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 23:15:22 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-307d20548adso1871227f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1684476921; x=1687068921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCYh8uS1PtNXF3LwY9umV8pnonHc4qG+wyV47LgNPyE=;
        b=luy86l3Q6tr9NE36/PaWY/NMcy3vQDicAQDuobaG/T7kxch7KuZ8BVQ+wVi/vL9S6f
         kY3dQObPjIhNNCCUF+fzApWI0G6ehTqeAzN3LngL2hwTlbsP8Xj4RkODjGjD4FE84HBk
         CmhrMa40U75tpP4FC10rrbW8OBQK0xBmQgDhR7bDcO+mBlysOh5+1kZx0YHH3J1vqnvo
         zyQZaRe12+IkmBfektwQgUAerZJs84gM12s/JYFwVYiK8pjU/AByk0NcrVXzBivUThJD
         PDjMLFdLsf99KtU/w/gFGj+2a78jv7oCqpsn+31Z4z9OB228QG76QUCn6KD+bhBVKF0Y
         nbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684476921; x=1687068921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCYh8uS1PtNXF3LwY9umV8pnonHc4qG+wyV47LgNPyE=;
        b=g5QUtQduRBuu8Ko8sJtJjQk4N+iGxs1NSLQMREURkavhKbxjIYz/mjJmcNh25mBjkK
         0JQJ55vZn28U34JGdltjaDpOAIIVd36YNY+U2ROlLRgYbrc4PputXIKNkkVkRH2bg14e
         i2cotaLZS1rML+rJfWORiZlYDxoHZoHJlfdVTFgvGlGpNgK+v1ORNc65bk2ZSkeW0JRS
         pvL8QJnkC1CAQnkZrnhcf6mt6JX846SB8HHvX1Shlj4kbX/2sCOFYjCQbENqM5Tp+a90
         M4yHcICVKQ8fYaMTHI3BuFTlUhMgXW4tmBldfWAdyQAV/MMAlNLvtBNSfUZUbKiRJagk
         2HcQ==
X-Gm-Message-State: AC+VfDykSKdkq/mg6P54VeD1esGj+2D12HKtHVXHNY+kdlPIdSEUSyS5
        8Kyl3+s7I/6PsE3u9wktTvVn8A==
X-Google-Smtp-Source: ACHHUZ4ZwhFo+c6dqH/926xcq+W9gpeBGHfa3x8yDrWM5NcnK/XK6011FVVufCnnN9UCun2EEVMjNw==
X-Received: by 2002:adf:e4c5:0:b0:305:e8db:37df with SMTP id v5-20020adfe4c5000000b00305e8db37dfmr762233wrm.22.1684476920736;
        Thu, 18 May 2023 23:15:20 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id d18-20020adff852000000b002ca864b807csm4334055wrq.0.2023.05.18.23.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 23:15:19 -0700 (PDT)
Date:   Fri, 19 May 2023 08:15:18 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
Message-ID: <ZGcT9tx/xsKGVYBU@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-6-vadfed@meta.com>
 <ZFJRIY1HM64gFo3a@nanopsycho>
 <DM6PR11MB4657EAF163220617A94154A39B789@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZGMiE1ByArIr8ARB@nanopsycho>
 <DM6PR11MB4657F542DD71F61FD2A1C20B9B7F9@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657F542DD71F61FD2A1C20B9B7F9@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 18, 2023 at 06:06:03PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Tuesday, May 16, 2023 8:26 AM
>>
>>Tue, May 16, 2023 at 12:07:57AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>Sent: Wednesday, May 3, 2023 2:19 PM
>>>>
>>>>Fri, Apr 28, 2023 at 02:20:06AM CEST, vadfed@meta.com wrote:
>>>>>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

[...]


>>>>>+			pins[i].pin = NULL;
>>>>>+			return -ENOMEM;
>>>>>+		}
>>>>>+		if (cgu) {
>>>>>+			ret = dpll_pin_register(pf->dplls.eec.dpll,
>>>>>+						pins[i].pin,
>>>>>+						ops, pf, NULL);
>>>>>+			if (ret)
>>>>>+				return ret;
>>>>>+			ret = dpll_pin_register(pf->dplls.pps.dpll,
>>>>>+						pins[i].pin,
>>>>>+						ops, pf, NULL);
>>>>>+			if (ret)
>>>>>+				return ret;
>>>>
>>>>You have to call dpll_pin_unregister(pf->dplls.eec.dpll, pins[i].pin, ..)
>>>>here.
>>>>
>>>
>>>No, in case of error, the caller releases everything
>>ice_dpll_release_all(..).
>>
>>
>>How does ice_dpll_release_all() where you failed? If you need to
>>unregister one or both or none? I know that in ice you have odd ways to
>>handle error paths in general, but this one clearly seems to be broken.
>>
>
>It doesn't have to, as release all would release all anyway.
>Leaving it for now.

So you call dpll_pin_unregister() even for the pin that was not
registered before? How is that even remotely correct?

Fix your error paths, please. I don't understand the resistance here :)

[...]
