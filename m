Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E33C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 17:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236673AbiDWSB5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 14:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbiDWSBz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 14:01:55 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC971DA429
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 10:58:57 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b19so15249941wrh.11
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8Kp5Q1vS0qC7/glbftIgd1JyC43ZLOUVon+K5fIPn5o=;
        b=kdFHFAQI714HGQRNu3HLEzwruvNHj2VG2kP5gN91fvdPuj5IQKcwIQ2h9B6TZe9++t
         LRqVj6ve0sVqn92288cEAFhgJZ+5OEBGqs7KSN6IHMmpA4yOS8ByPlLU71u8VssdxID5
         L1Ab5WnwFlgN3YJfk6UT7bXMX/d9APnKhinl0YiP0TGliMEvtrEVsDn7696t54iIo5Hk
         dJXNS1B8jOE4XUs3e2686L7vXwB8zwVUYFWd/NbTl6bAlGuy7RwONIS2OCfJkp/k/Vbr
         QzoZ1IUAufWjVmT4dp9rNQjWYP/XNO2Gz9ubSQo1xH80juy9eJfNFs3hdc2y0TarnAPe
         pvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8Kp5Q1vS0qC7/glbftIgd1JyC43ZLOUVon+K5fIPn5o=;
        b=4AfKJfmrnKztqQnI4AKYdnlIxWATj8WiXhjuGgOMIBXidGfvfgMhLnhqRMBojKwg90
         KbSBTRBZJxyWXPtmeKZ7dGp7l4lsPk7evLQCq0Q2f9ewdJFH8ad7yShEFdr7NWHdZ1Ul
         hDaxL167DNrOyxGTQgIYShN+hdHY7UKldZZtysSe+ZSUd4XgpuCenotYko9a5BoYiqIs
         0hrmT+3JXCfKCcWMRWBZaHZdUi5dxWZyyV+WBx7u9tOJpgJgWW7qQ/qjHupJEe9Pc4fu
         tbgnuvqL2M6ZvYORTFGRWv6jylYsbMkw90prLRUL1t1h8Qfqn5xmNAffLfaKTgJjaqzB
         Dy8A==
X-Gm-Message-State: AOAM531bsQ57fASUH7AhRvzal863cZMIbY/OU84eXFkpZjOEMolY3UVE
        mq1s/UdUlm4LR+nG2SMj59FyYA==
X-Google-Smtp-Source: ABdhPJy4qom34eZ6mVdIY8SbAZlO8Hyobh8HVWgZA+5RgKrP5ipkq5Vn3x0OnSwah/JrOmbFwKj6pQ==
X-Received: by 2002:a05:6000:1864:b0:20a:9ac6:b166 with SMTP id d4-20020a056000186400b0020a9ac6b166mr8334383wri.354.1650736736178;
        Sat, 23 Apr 2022 10:58:56 -0700 (PDT)
Received: from [192.168.2.116] ([109.76.213.55])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b00392951086efsm7744297wmq.34.2022.04.23.10.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:58:55 -0700 (PDT)
Message-ID: <207bacb2-40a3-49e9-e766-433d152149c4@conchuod.ie>
Date:   Sat, 23 Apr 2022 18:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/9] clk: microchip: mpfs: fix parents for FIC clocks
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        aou@eecs.berkeley.edu, krzk+dt@kernel.org, mturquette@baylibre.com,
        palmer@rivosinc.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-2-conor.dooley@microchip.com>
 <20220423014103.8574CC385A0@smtp.kernel.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220423014103.8574CC385A0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/04/2022 02:41, Stephen Boyd wrote:
> Quoting Conor Dooley (2022-04-13 00:58:28)
>> The fabric interconnects are on the AXI bus not AHB.
>> Update their parent clocks to fix this.
>>
>> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
> 
> Applied to clk-fixes

Thanks!
