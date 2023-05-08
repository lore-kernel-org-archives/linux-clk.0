Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B4BC7EE22
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 12:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbjEHMRj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 08:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjEHMRh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 08:17:37 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5C82E057
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 05:17:34 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30796c0cbcaso892962f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683548253; x=1686140253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPwugTUEtVq5Uj3H7DR5qqfTvvaV0QUu9h3q5nQeCX4=;
        b=VVg+QTowSAgRtuHW8vb93EmhtYhqGVCX9BzBM6g61T94jqpBacMgF9b+tB7h+T8/lG
         TfbShgF9dGpPk7qtZN9muE4EBalexkiiv3fXHkCQb2F8G50DECZlOHJVISvNt1jjOtIL
         BCFhO48sGe9pP6W3rkDpEqLgV8wut+zPMsINaphirm+ieoTBmKEPJCcTbti+cuorrpUG
         +pGdg4zeC/Rh9Iyx6/BGFDjlsLlgrzUdkoEUS1FtEWI352/Vdo7ltG8q/992ODusD7un
         d5N49WjIbEEFo4RRL/zpeY4ef2m0m4oEu4Pgsa1N6Oi7wztMRx8p3NLzQxHXPfXnPYDs
         UOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683548253; x=1686140253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPwugTUEtVq5Uj3H7DR5qqfTvvaV0QUu9h3q5nQeCX4=;
        b=XXLfpSI1w1qZbXNFmeBFhn2OsYmb06GknzAVLlkVYDXqq1smh1SXdYKQaCi3DhxTri
         0WkIQ4JH1CDoZAucVWVaI0ck1+ecjzOBbh0dDxY8/x48kXDvtusiTWcB+QlWFoc3E+n2
         9BAgzMzUBqfU5OKMLHXrV34GBrUAiFfI8vnNCnJPg6uG48btPqHtrbrp/eawU8lYoUWs
         ZqSamysHhP9dymOgEgAUOMviOgevd7P0EkTpZh/FmExtcgE677oqa3B70odlDwXLANKp
         ampIf/QfCzS7Sq8rs4TKMj3Jsjl7EOTcGForlYbF2fwTorunooPm9zEepMqV2y+csGLf
         TO4w==
X-Gm-Message-State: AC+VfDyK39ysF5CeyX7sNKbCZBkNKSmMoYu0WJf7ebkFzBnFvnLfjOTo
        iwq3xK8Ykb4BGa6vHwB67rQ82Q==
X-Google-Smtp-Source: ACHHUZ4E6ajP9+kyFa3qZr84KHy9kUfD8AcS49xwioZ0VY0cqr2mu/Czkz/SCfQdsmMB7lKFUi4czw==
X-Received: by 2002:a5d:4749:0:b0:2f2:79ce:4836 with SMTP id o9-20020a5d4749000000b002f279ce4836mr7291868wrs.60.1683548252581;
        Mon, 08 May 2023 05:17:32 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id z6-20020adff746000000b002f103ca90cdsm11181011wrp.101.2023.05.08.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:17:31 -0700 (PDT)
Date:   Mon, 8 May 2023 14:17:30 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZFjoWn9+H932DdZ1@nanopsycho>
References: <ZFITyWvVcqgRtN+Q@nanopsycho>
 <20230503191643.12a6e559@kernel.org>
 <ZFOQWmkBUtgVR06R@nanopsycho>
 <20230504090401.597a7a61@kernel.org>
 <ZFPwqu5W8NE6Luvk@nanopsycho>
 <20230504114421.51415018@kernel.org>
 <ZFTdR93aDa6FvY4w@nanopsycho>
 <20230505083531.57966958@kernel.org>
 <ZFdaDmPAKJHDoFvV@nanopsycho>
 <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, May 08, 2023 at 08:50:09AM CEST, pabeni@redhat.com wrote:
>On Sun, 2023-05-07 at 09:58 +0200, Jiri Pirko wrote:
>> Fri, May 05, 2023 at 05:35:31PM CEST, kuba@kernel.org wrote:
>> > On Fri, 5 May 2023 12:41:11 +0200 Jiri Pirko wrote:
>> > > 
>> > Sound perfectly fine, if it's a front panel label, let's call 
>> > the attribute DPLL_A_PIN_FRONT_PANEL_LABEL. If the pin is not
>> > brought out to the front panel it will not have this attr.
>> > For other type of labels we should have different attributes.
>> 
>> Hmm, that would kind of embed the pin type into attr which feels wrong.
>
>Looking at the above from a different angle, the
>DPLL_A_PIN_FRONT_PANEL_LABEL attribute will be available only for
>DPLL_PIN_TYPE_EXT type pins, which looks legit to me - possibly
>renaming DPLL_A_PIN_FRONT_PANEL_LABEL as DPLL_A_PIN_EXT_LABEL.

Well sure, in case there is no "label" attr for the rest of the types.
Which I believe it is, for the ice implementation in this patchset.
Otherwise, there is no way to distinguish between the pins.
To have multiple attrs for label for multiple pin types does not make
any sense to me, that was my point.


>
>Cheer,
>
>Paolo
>
