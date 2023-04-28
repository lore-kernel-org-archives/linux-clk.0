Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA65C77B61
	for <linux-clk@archiver.kernel.org>; Fri, 28 Apr 2023 02:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjD1CgO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Apr 2023 22:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjD1CgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Apr 2023 22:36:13 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63BD268E
        for <linux-clk@vger.kernel.org>; Thu, 27 Apr 2023 19:36:12 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b52ad6311so10690448b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Apr 2023 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20221208.gappssmtp.com; s=20221208; t=1682649372; x=1685241372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mabVRxzEGGHbF8RBp4qV18M2pQVzukOEEXZ/JbaAVw=;
        b=yR2ujzKAjK0kwnfoHkSiD0Q/a3rqL3ZmFI757Hj5nUlTZZVaCTXh+VLoqXKomGSZfi
         4ZtHvKRXxNVqCEX2gpjJlwSou8cMUPvJ4Tu+QVDLigLlajRD9WNTdpYh7A18toRqfHP3
         s4REkHFTFs+17a/nPcE34QCa6SSs/HC+DeVoiaGOFtjqPq6TUrm+1MIZHooroRT8lHBJ
         /raTKgyAaWF2hRF8DzMEzAkqC316C7+a4uDzBfUYgnepppp6wrX56XyA8kJjJEXsUIcb
         v1e2Jc/4rONpJXbTcLpNi/hm/u3zWIYO8bXkFhs72n9sRp9dpjbiho4Ddo1zeBhdGegY
         SgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682649372; x=1685241372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mabVRxzEGGHbF8RBp4qV18M2pQVzukOEEXZ/JbaAVw=;
        b=FRcR27aIbMwYAybYHMNMTekaaS6DEI5f4SS+Uxq/b1gBrr8KTL7zpjv758NDUYyQ70
         HMHPFFwkSq5mmIhbRdJb83e3JKebbsFbqT0/rnkbcHfi1uRzY0rs//qGiOVbLrwzLxvz
         gWNKQ76DMFnOWdSxMoGgupsvyDvEyPwDyv88WwOApgUQSAvelGwdHthlskuKiXpW74Ub
         St1PqbP3PC4YdpW2+qgr69YPdPxqGjEGz/nsDNrcJQ2MzOMpjIzWtPeAWdg9OiRua/Sg
         h5nlOOhl8lDXhy5mcrE9SApe91lOqu0cnxlCgCLgFZyl1rtZRNVjOaAR+fUyPrm819Hr
         BpCg==
X-Gm-Message-State: AC+VfDyxZTlecR2KaxsiyHZmudqJgyWiKD2bS7xazvfU2k41wiSAl5+A
        3IGgk/o97e5fjeLhB3qfArpFQ4D670ZrqzzVEtk+3g==
X-Google-Smtp-Source: ACHHUZ4yFH/hBsrNG9tlS5VkUNVltVqd0Sr2iuScvyjUmezEA6kgB9cLlVBoRlIFWUWRFNGsJxwH6A==
X-Received: by 2002:a05:6a21:9205:b0:f1:2096:405a with SMTP id tl5-20020a056a21920500b000f12096405amr3736364pzb.28.1682649372411;
        Thu, 27 Apr 2023 19:36:12 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id u10-20020a63234a000000b0050be8e0b94csm11755469pgm.90.2023.04.27.19.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 19:36:12 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:36:10 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Jiri Pirko <jiri@nvidia.com>, <poros@redhat.com>,
        <mschmidt@redhat.com>, <netdev@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
Message-ID: <20230427193610.6d620434@hermes.local>
In-Reply-To: <20230428002009.2948020-8-vadfed@meta.com>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-8-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 27 Apr 2023 17:20:08 -0700
Vadim Fedorenko <vadfed@meta.com> wrote:

> +size_t dpll_msg_pin_handle_size(struct dpll_pin *pin)
> +{
> +	// TMP- THE HANDLE IS GOING TO CHANGE TO DRIVERNAME/CLOCKID/PIN_INDEX
> +	// LEAVING ORIG HANDLE NOW AS PUT IN THE LAST RFC VERSION

Please don't use C++ style comments
