Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F49EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jul 2023 15:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbjGUPwc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjGUPwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 11:52:14 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0A035B1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 08:51:50 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99454855de1so304420866b.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1689954693; x=1690559493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9cwznzOyqJDHu1/UhNckA/YkZqmokkA3oSqw8rZ1hk=;
        b=yTQ5wr9/bSl1aYjgUbtyKyg8tBdMOvv1hZaWwKPZJV+OoBzAj1Uavi/48Sj6rg8LHA
         GK0/ZWOa0skXA6ZuaWlQS15fkkymddLNmq2d+5yzppO82tTrv2jLbYywAAdakqz+8GMQ
         bGxuK48ZJC0XIwKrUK1lyxTclyKD1QQjdEQ1/UR8XzauYi62fUfcnsU/Skc474iY0uWw
         BcbG6s12Ro+UovLxy/rk1pY74J7kIAKEdbL9ignde0mcW1s8bzqQ8gA8Wrxn8l1GdAUV
         Oy/PG95dFBCZYPbi2OgFUwar81wm5Uag6MAStGREx2UErz2TDkJ6X/6inn6Vo4Mh3Wa5
         h+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954693; x=1690559493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9cwznzOyqJDHu1/UhNckA/YkZqmokkA3oSqw8rZ1hk=;
        b=XmZuywkWZm4rWJ7XWRogVpqwdnxn7MB3o6E/9lKkXXO8vuZkao+Dnlp0XA5jHv1RqO
         FXFWV1atKB5svBMUfCIs4f+0ne5dLW3BLswW+BnMjipczD8RDo50wekQKFRNvjE5mo19
         AldCN5qAba62PKF9c7JugzjjPY1kVfTzEIf3p8goH8RFiOHTvB2gDHUvYmD70aN7uadn
         DW85v/WsQxtCp9o7YWYqnc00Wgasy2ixBp90e1vXdLKfJsd9uCeDQHpJ/Yp3sNkE1zu9
         ShJGKsWBDOzyIJO7DIGWQmXIFE3GKDLZ5dDJS5pMlnpwXmPUiNCCxDhduoQOpuvUfm3y
         1Lqw==
X-Gm-Message-State: ABy/qLYbl0QVnqORA//mb3RcIENb1/et+9ZySQ6nuJFYPWEaN8OZBnCb
        nlfTWPGSwbuTrNdll7L9HV17NA==
X-Google-Smtp-Source: APBJJlFEwPtUfRs4GScQym4N9EIjtvMfz4M+uCsYtdVnHBQl7gNckmj2NfBO/8nwtkgU6hGJ4TkPsg==
X-Received: by 2002:a17:906:538b:b0:99b:627f:9c0d with SMTP id g11-20020a170906538b00b0099b627f9c0dmr1966315ejo.27.1689954693002;
        Fri, 21 Jul 2023 08:51:33 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id jx21-20020a170906ca5500b00988a0765e29sm2332570ejb.104.2023.07.21.08.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:51:32 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:51:31 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 10/11] ptp_ocp: implement DPLL ops
Message-ID: <ZLqpg8sKBDxr7wLj@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-11-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720091903.297066-11-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Jul 20, 2023 at 11:19:02AM CEST, vadim.fedorenko@linux.dev wrote:
>Implement basic DPLL operations in ptp_ocp driver as the
>simplest example of using new subsystem.
>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
