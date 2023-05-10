Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA983C7EE22
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 06:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjEJGRh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 02:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjEJGRh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 02:17:37 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECA11BE5
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 23:17:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bcb4a81ceso12174418a12.2
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 23:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683699454; x=1686291454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi/H+4vcA1XwWqCdxJ1Nxxc0MUXpGvlxZ7cka5x3wZs=;
        b=R+u7Xm5Q2Nu+ndyU7wc3xg+GcGAun0bAvGoAuh/DWUTndRb5A+yN/KUDcJnzpZSviE
         PEgrfmaM8qL9TDUs54xH2od8jrNQK2geqkkWkGOU/l+ylGkR2kEK509dYEhLP3xGEmQZ
         vPjx2r/lY6Jg4ynK7CtN7MUE/0k3YHXOFEeo/EwsZSMU79A9dmScvTGobVGV4rW5QehH
         MY+XIr/2uCHlvdb/1gm9/PBlBU9ZPA13MRZS+vhAqq61XRXZDjByuU6GqEQcJSkQxBH0
         Sf7gXsHxhPW3/fRf5rCuIKXQzhzpfAR5an6Q773QctzNDdm3ouoelSESmCTBytwGJEn3
         koWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683699454; x=1686291454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi/H+4vcA1XwWqCdxJ1Nxxc0MUXpGvlxZ7cka5x3wZs=;
        b=Sa4LqMSxKYkLQu7v4fiUTbnbn5VhFMS1alUcGUId42KuB65owbiZ14ROxU0MsbleZm
         BvjXyjumY3P1DVbwY4pAgo1X0woqj7xZBICJSXzRRH7+2ayMCiABRNfrzKFZ/PpT6Btf
         ooQlWWvviNh1E58f8M2EQlu25zw9J8IROvSSNWmAlrenGdZVxbhbzQV18awnI17o21jr
         yblZcihKcywmwY5pLQKdg4brvvGpGN2lKCCx70mZK/T4AHeOBUfTfIk0dm7O7t7b17LO
         dmKYmP+/+xD4xe3LkPxuQJOXufPTSS3+K/H9eJU0mc+/toPj79iXvTXMnzrkmd2kqkDv
         /gzA==
X-Gm-Message-State: AC+VfDwSMWs9uSVdKRNSbRQZPRP1IZBZdige1zD/w0q9IIxHMUIcupUB
        iMeL9Ar+4YeDUWizSxmK8r+CWCoFtkeUmoyL+yDTAQ==
X-Google-Smtp-Source: ACHHUZ45hsnX5rpB8HcN8K9nSWDOo5C39Skbi5ZKI8RRwNBIJZvzcexxUsaUJx0AinG76gTV41zsng==
X-Received: by 2002:a05:6402:1255:b0:50c:646:cafd with SMTP id l21-20020a056402125500b0050c0646cafdmr12351193edw.7.1683699454274;
        Tue, 09 May 2023 23:17:34 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id v16-20020a056402185000b0050cc4461fc5sm1482888edy.92.2023.05.09.23.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 23:17:33 -0700 (PDT)
Date:   Wed, 10 May 2023 08:17:32 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Paolo Abeni <pabeni@redhat.com>,
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
Message-ID: <ZFs2/Fr9lLBem9zl@nanopsycho>
References: <ZFTdR93aDa6FvY4w@nanopsycho>
 <20230505083531.57966958@kernel.org>
 <ZFdaDmPAKJHDoFvV@nanopsycho>
 <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
 <ZFjoWn9+H932DdZ1@nanopsycho>
 <20230508124250.20fb1825@kernel.org>
 <ZFn74xJOtiXatfHQ@nanopsycho>
 <20230509075247.2df8f5aa@kernel.org>
 <ZFplBpF3etwRY5nv@nanopsycho>
 <20230509105302.3703216c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509105302.3703216c@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, May 09, 2023 at 07:53:02PM CEST, kuba@kernel.org wrote:
>On Tue, 9 May 2023 17:21:42 +0200 Jiri Pirko wrote:
>> Tue, May 09, 2023 at 04:52:47PM CEST, kuba@kernel.org wrote:
>> >On Tue, 9 May 2023 09:53:07 +0200 Jiri Pirko wrote:  
>> >> >Yup. Even renaming EXT to something that's less.. relative :(    
>> >> 
>> >> Suggestion?  
>> >
>> >Well, is an SMT socket on the board an EXT pin?
>> >Which is why I prefer PANEL.  
>> 
>> Makes sense.
>> To speak code, we'll have:
>> 
>> /**
>>  * enum dpll_pin_type - defines possible types of a pin, valid values for
>>  *   DPLL_A_PIN_TYPE attribute
>>  * @DPLL_PIN_TYPE_UNSPEC: unspecified value
>>  * @DPLL_PIN_TYPE_MUX: aggregates another layer of selectable pins
>>  * @DPLL_PIN_TYPE_PANEL: physically facing user, for example on a front panel
>>  * @DPLL_PIN_TYPE_SYNCE_ETH_PORT: ethernet port PHY's recovered clock
>>  * @DPLL_PIN_TYPE_INT_OSCILLATOR: device internal oscillator
>>  * @DPLL_PIN_TYPE_GNSS: GNSS recovered clock
>>  */
>> enum dpll_pin_type {
>>         DPLL_PIN_TYPE_UNSPEC,
>>         DPLL_PIN_TYPE_MUX,
>>         DPLL_PIN_TYPE_PANEL,
>>         DPLL_PIN_TYPE_SYNCE_ETH_PORT,
>>         DPLL_PIN_TYPE_INT_OSCILLATOR,
>>         DPLL_PIN_TYPE_GNSS,
>> 
>>         __DPLL_PIN_TYPE_MAX,
>>         DPLL_PIN_TYPE_MAX = (__DPLL_PIN_TYPE_MAX - 1)
>> };
>
>Maybe we can keep the EXT here, just not in the label itself.
>Don't think we care to add pin type for PANEL vs SMT vs jumper?

Okay:
 enum dpll_pin_type {
         DPLL_PIN_TYPE_UNSPEC,
         DPLL_PIN_TYPE_MUX,
	 DPLL_PIN_TYPE_EXT,
         DPLL_PIN_TYPE_SYNCE_ETH_PORT,
         DPLL_PIN_TYPE_INT_OSCILLATOR,
         DPLL_PIN_TYPE_GNSS,

         __DPLL_PIN_TYPE_MAX,
         DPLL_PIN_TYPE_MAX = (__DPLL_PIN_TYPE_MAX - 1)
};



>
>> >> Sure, I get what you say and agree. I'm just trying to find out the
>> >> actual attributes :)  
>> >
>> >PANEL label must match the name on the panel. User can take the card
>> >into their hand, look at the front, and there should be a label/sticker/
>> >/engraving which matches exactly what the kernel reports.
>> >
>> >If the label is printed on the board it's a BOARD_LABEL, if it's the
>> >name of a trace in board docs it's a BOARD_TRACE, if it's a pin of 
>> >the ASIC it's a PACKAGE_PIN.
>> >
>> >If it's none of those, or user does not have access to the detailed
>> >board / pinout - don't use the label.  
>> 
>> To speak code, we'll have:
>> DPLL_A_PIN_PANEL_LABEL (string)
>>    available always when attr[DPLL_A_PIN_TYPE] == DPLL_PIN_TYPE_PANEL
>
>Not sure about always, if there's only one maybe there's no need 
>to provide the label?

Well, I would like to have check in pin_register() for this. That would
be non-trivial if this would be required only in case pin_count>1.
However I can imagine a card with one connector without any label on it.
IDK.


>
>> DPLL_A_PIN_BOARD_LABEL (string)
>>    may be available for any type, optional
>> DPLL_A_PIN_BOARD_TRACE (string)
>>    may be available for any type, optional
>> DPLL_A_PIN_PACKAGE_PIN (string)
>>    may be available for any type, optional
>> 
>> Makes sense?
>
>yup (obviously we need to document the semantics)

Agreed.


>
>> But this does not prevent driver developer to pack random crap in the
>> string anyway :/
>
>It doesn't but it hopefully makes it much more likely that (1) reviewer
>will notice that something is off if the driver printfs random crap;
>and (2) that the user reading the documentation will complain that 
>e.g.BOARD_LABEL is used but does not match the label on they see...

Fair.
