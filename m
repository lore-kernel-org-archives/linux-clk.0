Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C603C77B7C
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 15:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbjEIPVt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 11:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjEIPVs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 11:21:48 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5911B1
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 08:21:46 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc1612940so11274516a12.2
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683645704; x=1686237704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wvCEZfId/fWNIx4HgBGUsppKXANxR0uG7KeHB2lWb8=;
        b=HcQTsWgDvkDpMrebpBesWV3VrgkRlui8LjtpJlxitySTXOX70fwW6jWgA6iCJGzBDC
         48YfxXgR/pm8g5XGJVXBCSNLQxSFaTXBipsmRQMzuGdfKlUy+7GqDrNjw/EF0WWJK4jq
         G1lAgla/93C2XJc0/e5HbpGZMRaE8lyrukcHoutDDTTjeF3AdzBORs5imU8hGJoxpr2b
         EMyRwhwz6gnHdgC7HIwWQ1YgpvHd/eveNlVeaPpZzNoIYSmSmks/ZGllmeNbrCDenyd1
         zW3VkYIFjvPOEN7si+CdGkqvtX0nnc7HB2k0+6VLNaBwuNC18kiSUdo/X2b53PbvKQ3X
         Vo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683645704; x=1686237704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wvCEZfId/fWNIx4HgBGUsppKXANxR0uG7KeHB2lWb8=;
        b=f6EHfruStoNP0fybV1/wL9zSgWR84LBIaGVSLKi4CI7vNUBDFs7B79Q5e+nUtWB2O5
         ptI3khOAr6MBq9/KfLynnGVoyAdyk7btku98+00JH/OS1umkS7USUa0X6lfDSlSHLu6f
         lw0Hyr98NxpAn3rq0wwxGa8kEqNDVJKy6B4S5Fzg9oMLUww8ocKVwVPCYDLQUaktjtgA
         cBYL/QqzhiA2YerHx4SGAyQgXwfqz2QCH1PzPRDzoqQd/AH3uimfbJ0UlrDy5KGi+M/Z
         kMlqIm3emW+d8XQY8r3Xi4FGtsh03lFihQ0LlhSaNc5B6QAF5FefPZk9PztqoyxgfCHv
         WO+A==
X-Gm-Message-State: AC+VfDw7P6rdVyahjpvMWIh1n49CQ2pH4K+Y9P4EBSkiLgNaHwiSONfe
        ZCLgRg8h9xxeSFzTNs+vV2kYbw==
X-Google-Smtp-Source: ACHHUZ7hkZqAjy1MhZ9RwgKJeNps/7jxzvhtYzIuCS9ctN0awt0ruwSz29mq/RH7b1Rz1fWVkYjcag==
X-Received: by 2002:a17:907:d91:b0:933:4d37:82b2 with SMTP id go17-20020a1709070d9100b009334d3782b2mr12927600ejc.57.1683645704296;
        Tue, 09 May 2023 08:21:44 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id jz10-20020a17090775ea00b00965ef79ae14sm1423719ejc.189.2023.05.09.08.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:21:43 -0700 (PDT)
Date:   Tue, 9 May 2023 17:21:42 +0200
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
Message-ID: <ZFplBpF3etwRY5nv@nanopsycho>
References: <ZFPwqu5W8NE6Luvk@nanopsycho>
 <20230504114421.51415018@kernel.org>
 <ZFTdR93aDa6FvY4w@nanopsycho>
 <20230505083531.57966958@kernel.org>
 <ZFdaDmPAKJHDoFvV@nanopsycho>
 <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
 <ZFjoWn9+H932DdZ1@nanopsycho>
 <20230508124250.20fb1825@kernel.org>
 <ZFn74xJOtiXatfHQ@nanopsycho>
 <20230509075247.2df8f5aa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509075247.2df8f5aa@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, May 09, 2023 at 04:52:47PM CEST, kuba@kernel.org wrote:
>On Tue, 9 May 2023 09:53:07 +0200 Jiri Pirko wrote:
>> >Yup. Even renaming EXT to something that's less.. relative :(  
>> 
>> Suggestion?
>
>Well, is an SMT socket on the board an EXT pin?
>Which is why I prefer PANEL.

Makes sense.
To speak code, we'll have:

/**
 * enum dpll_pin_type - defines possible types of a pin, valid values for
 *   DPLL_A_PIN_TYPE attribute
 * @DPLL_PIN_TYPE_UNSPEC: unspecified value
 * @DPLL_PIN_TYPE_MUX: aggregates another layer of selectable pins
 * @DPLL_PIN_TYPE_PANEL: physically facing user, for example on a front panel
 * @DPLL_PIN_TYPE_SYNCE_ETH_PORT: ethernet port PHY's recovered clock
 * @DPLL_PIN_TYPE_INT_OSCILLATOR: device internal oscillator
 * @DPLL_PIN_TYPE_GNSS: GNSS recovered clock
 */
enum dpll_pin_type {
        DPLL_PIN_TYPE_UNSPEC,
        DPLL_PIN_TYPE_MUX,
        DPLL_PIN_TYPE_PANEL,
        DPLL_PIN_TYPE_SYNCE_ETH_PORT,
        DPLL_PIN_TYPE_INT_OSCILLATOR,
        DPLL_PIN_TYPE_GNSS,

        __DPLL_PIN_TYPE_MAX,
        DPLL_PIN_TYPE_MAX = (__DPLL_PIN_TYPE_MAX - 1)
};


>
>> >> Well sure, in case there is no "label" attr for the rest of the types.
>> >> Which I believe it is, for the ice implementation in this patchset.
>> >> Otherwise, there is no way to distinguish between the pins.
>> >> To have multiple attrs for label for multiple pin types does not make
>> >> any sense to me, that was my point.  
>> >
>> >Come on, am I really this bad at explaining this?  
>> 
>> Or perhaps I'm just slow.
>> 
>> >If we make a generic "label" attribute driver authors will pack
>> >everything they want to expose to the user into it, and then some.  
>> 
>> What's difference in generic label string attr and type specific label
>> string attr. What is stopping driver developers to pack crap in either
>> of these 2. Perhaps I'm missing something. Could you draw examples?
>> 
>> >So we need attributes which will feel *obviously* *wrong* to abuse.  
>> 
>> Sure, I get what you say and agree. I'm just trying to find out the
>> actual attributes :)
>
>PANEL label must match the name on the panel. User can take the card
>into their hand, look at the front, and there should be a label/sticker/
>/engraving which matches exactly what the kernel reports.
>
>If the label is printed on the board it's a BOARD_LABEL, if it's the
>name of a trace in board docs it's a BOARD_TRACE, if it's a pin of 
>the ASIC it's a PACKAGE_PIN.
>
>If it's none of those, or user does not have access to the detailed
>board / pinout - don't use the label.

To speak code, we'll have:
DPLL_A_PIN_PANEL_LABEL (string)
   available always when attr[DPLL_A_PIN_TYPE] == DPLL_PIN_TYPE_PANEL
DPLL_A_PIN_BOARD_LABEL (string)
   may be available for any type, optional
DPLL_A_PIN_BOARD_TRACE (string)
   may be available for any type, optional
DPLL_A_PIN_PACKAGE_PIN (string)
   may be available for any type, optional

Makes sense?

But this does not prevent driver developer to pack random crap in the
string anyway :/
