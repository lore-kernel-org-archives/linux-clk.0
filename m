Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C02EC6FD1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 16:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjCQQKL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 12:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjCQQKK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 12:10:10 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D016CF
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 09:10:08 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v25so1458368wra.12
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679069407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UjzDxDVWXiH7vDhwwdNksFwW7YtaxEhKuy7mNkKU/kY=;
        b=WLtYCSEw6QZI9xCr3EfpQa/4pvjbN6mMOrCWKnyFC71zf7OLUE1vSzp76q1DKeOLvA
         A5qVA3aHYRzDHcj5adEuiwVislL78m8zLrH2E3NYuaZcwvkeXjtwy4jRS7z+aAl0j6d4
         nmvscTrM2Ogf1O2YqX9qmjinE3f/dNi+OoHbbO0tWhqeSf4Vul2FtoeqqosCN0fShjQo
         GZ0M2gGrqJDRHKU/H4YfV18sjgP5QMSaroqqjz7dyEPtPhCQ3HxaatLICuvI0wXSK/m1
         /gyTlC4AXPR6wQIEKFs2h9P5r4WId/zJqdXfYiGdeZteSvQSdijhbZ58jGgpTRWz/eRX
         6/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679069407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjzDxDVWXiH7vDhwwdNksFwW7YtaxEhKuy7mNkKU/kY=;
        b=oKwJwcr0Pfh4wWUEVPgy4Yn7ZJUIKzH3W22/SjXEk3LPPcJJXmlj6G20wwJRJHdKdb
         HVwRI2OUil8EC43/isSfOc1YkdGIr+3Q2VAqOlAbu86ZxKDzG3/UCXSmMgCS5QQ7UD00
         +EgeRp5TZHVz1XFMzWiOX3XzpWc8YDxjWoC+tQ7TX1Lnybl8WYLBQesKzBzBpvl7xffS
         KlLK/9zZrGDYMoMLu3W4qGSOYfLQK3ej17Y04xpSTXIncwy8OqoUTfWdc7V/qgeuW0dD
         TeFlF13jW3+b309GnewpTfZnglwK/Z3S8+cvw1RhGalz3LRYVgX2lP99lN/iQjjdX6sr
         DqKg==
X-Gm-Message-State: AO0yUKUyRKDFeC38CJc7LqD+qxQWohYqLWwNWQi/Lv8zi/aptOvzBaqE
        5ClygDWmdtTam3ucdN22R83g3w==
X-Google-Smtp-Source: AK7set93hypJDsMm1enAfIZg8215eCAIhP4PBJcZFx0zQJdvHMFklrJCpfni543ui1ToxFKL4ckHKw==
X-Received: by 2002:a05:6000:12c5:b0:2ce:a8f9:7cae with SMTP id l5-20020a05600012c500b002cea8f97caemr7964173wrx.53.1679069406830;
        Fri, 17 Mar 2023 09:10:06 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id y1-20020a5d4ac1000000b002ceaeb24c0asm2303163wrs.58.2023.03.17.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:10:05 -0700 (PDT)
Date:   Fri, 17 Mar 2023 17:10:04 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC v6 0/6] Create common DPLL/clock configuration API
Message-ID: <ZBSQ3MFzQSBfGH7O@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <ZA8VAzAhaXK3hg04@nanopsycho>
 <eb738303-b95c-408c-448d-0ebf983df01f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb738303-b95c-408c-448d-0ebf983df01f@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Mar 13, 2023 at 04:33:13PM CET, vadim.fedorenko@linux.dev wrote:
>On 13/03/2023 12:20, Jiri Pirko wrote:
>> Sun, Mar 12, 2023 at 03:28:01AM CET, vadfed@meta.com wrote:
>> > Implement common API for clock/DPLL configuration and status reporting.
>> > The API utilises netlink interface as transport for commands and event
>> > notifications. This API aim to extend current pin configuration and
>> > make it flexible and easy to cover special configurations.
>> 
>> Could you please put here some command line examples to work with this?
>
>We don't have open-source tools ready right now for specific hardware, but
>with YAML spec published you can use in-kernel tool to manipulate the values,
>i.e.:
>
>./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --dump
>device-get
>./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do
>device-get --json '{"id": 0}'
>./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --dump
>pin-get
>./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do
>pin-get --json '{"id": 0, "pin-idx":1}'
>./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do
>pin-set --json '{"id":0, "pin-idx":1, "pin-frequency":1}'

Interesting, is this working for you?
I'm experiencing some issue with cmd value. Example:
./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml --do device-get --json '{"id": 0}'
this should send DPLL_CMD_DEVICE_GET which is 1.
In kernel genl_family_rcv_msg() the hdr->cmd is 2
Any idea what might be wrong?

