Return-Path: <SRS0=SKve=W6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5223CC3A5A2
	for <linux-clk@archiver.kernel.org>; Tue,  3 Sep 2019 22:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2340522DBF
	for <linux-clk@archiver.kernel.org>; Tue,  3 Sep 2019 22:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lrzb33d5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfICWrG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Sep 2019 18:47:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32971 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfICWrG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Sep 2019 18:47:06 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so10039310pgn.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Sep 2019 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=hoDQ2otvh4YzrazXkMiS2cracj6ZVD3U75QlqFUCiSs=;
        b=lrzb33d5V9vzzhO82c5zXyKH4TqmgJW2X7aw4qMa7JO7/n4grzGNYlPbFDGM5JBZbC
         twNeBapGoiWv0TSEuroy5RaHLuLtTBkNBdo8VqsOeDaio4lo4/Tij9Pwy7OayQzfNqyD
         wm59VGKZTWH8uMoFTHamGpJfQ0K6J3rjK6o5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=hoDQ2otvh4YzrazXkMiS2cracj6ZVD3U75QlqFUCiSs=;
        b=D29RZ0NbM8ttMH2IZsTpASBo87ySMjn6V3QYDI6GHUjtH1PTCmfjfGRRNnZ+z96a78
         KabYo/1XaEorGpb+2Mr8Linx7ILe0PNImW90O31i/J1ubEGiF0D7qWk3+X/5FkKlQvKn
         jDSRmlV/ENDAuClT+eGVwPO3hyxwS2+Gb9ksTUHtCy3enbgd55XD5Dkwd4C3NQv/5W3U
         frSZFhJ3vmVXtdyVcX10u1+03KVoL+TeVWcCACHKrj8ws8VahFKb8eQKMAOfypMZ4Z/t
         IbUi/9dZqrXpfQ83TZPltAXPowoXKKUTwhiJfta7b/yyghmzptNkR0lwKdz6uK/Fff8e
         vHgA==
X-Gm-Message-State: APjAAAUjcxX+ugUZMIZRC+VVu1jxoKz2ESTtnO+fZoDK2Xi9coNXPE+1
        lkRwxuJKi1o9zQb4SB/ZRoVkKQ==
X-Google-Smtp-Source: APXvYqzWeCl7biAHHpauQRTYTdxKfJz4B7BxzgfR3nLDWhc1dYlvSW9t0r7ElVhEYX177Zn6WDT38g==
X-Received: by 2002:a63:8f55:: with SMTP id r21mr32188253pgn.318.1567550825858;
        Tue, 03 Sep 2019 15:47:05 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u69sm23055074pgu.77.2019.09.03.15.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 15:47:05 -0700 (PDT)
Message-ID: <5d6eed69.1c69fb81.b7ca5.7345@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <93435591-152a-46fd-4768-78f5e7af77ed@codeaurora.org>
References: <20190830195142.103564-1-swboyd@chromium.org> <CAD=FV=Vr5o-b86588qe--bVZ5YjKVB3gzaoYa6YcqCd9smkxVg@mail.gmail.com> <93435591-152a-46fd-4768-78f5e7af77ed@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
To:     Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 03 Sep 2019 15:47:04 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2019-09-03 08:52:12)
> Hi,
>=20
> On 8/31/2019 3:04 AM, Doug Anderson wrote:
> > Hi,
> >=20
> > On Fri, Aug 30, 2019 at 12:51 PM Stephen Boyd <swboyd@chromium.org> wro=
te:
> >>
> >> Some MMC cards fail to enumerate properly when inserted into an MMC sl=
ot
> >> on sdm845 devices. This is because the clk ops for qcom clks round the
> >> frequency up to the nearest rate instead of down to the nearest rate.
> >> For example, the MMC driver requests a frequency of 52MHz from
> >> clk_set_rate() but the qcom implementation for these clks rounds 52MHz
> >> up to the next supported frequency of 100MHz. The MMC driver could be
> >> modified to request clk rate ranges but for now we can fix this in the
> >> clk driver by changing the rounding policy for this clk to be round do=
wn
> >> instead of round up.
> >=20
> > Since all the MMC rates are expressed as "maximum" clock rates doing
> > it like you are doing it now seems sane.
> >=20
> >=20
>=20
> Looks like we need to update/track it for all SDCC clocks for all targets.
>=20

Yeah. It would be great if you can send the patches. Otherwise I'll
throw it on my todo list named 'forever'.

