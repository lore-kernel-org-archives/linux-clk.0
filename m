Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCC4C7EE2E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 03:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjFIDSI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 23:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237693AbjFIDRp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 23:17:45 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B38F30E6
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 20:17:41 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2564ced644bso259855a91.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 20:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686280661; x=1688872661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHwlFah6TNJBL/ErexJYYtB2nt57wQm7nvfSHdtao+8=;
        b=CUKwTGSk+PQreIIkkMYOfcJirTVrjqQrcJopAtP4WEjfEvPT31fR0K83hoKbrodiSO
         81weX5r6Msp6QBNhtMxh4jj1f8b4wwiPvzKEDINHijVvSRtgTONIDjcSv0gTbozNJld3
         WVu/JUwtT1ITFrxiHy/zc/fTl2jHJteYkNPHxnhzt+I7GpMZ2Sq6o3FGK9PdOs4lbioy
         4cG6dDvd2O3uZs42+QdsqfRc8xK0lMU1lKA5XHClBtlZYLFUXzWOZ2+O4ScmlHkPWPBM
         UULxYQQWDmK9aWUuqEGb/kpR8qrk1wVXNzgqlhWvMBH7vLN7Ch5ce46PBFrLJaGxbJYL
         MZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686280661; x=1688872661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHwlFah6TNJBL/ErexJYYtB2nt57wQm7nvfSHdtao+8=;
        b=JbdrUjqHs1c6jDNZvJgyweyZQx8woK4b0xXVUeFweuKfekIul0TW8ost53jZqWsboV
         ZxYr4uYBGsOi+pfgiILjSinWJ3YHYZJmtsjDb7CnOX16pUZKRxB2pujQRHLDvJ16RPvy
         yftg9jmJ/0Uu192Z6G5Ap7+uvmnKIWRThtGxJ4QoDhxSdoysbufkVgbt8gcAFeQFpClP
         mQ5Hy/6jqJGFke+kui+d3M0gRaU/UVXgTKTfOPRWckYKErrK/sNyQ1rG7A+Wxw4eQcaT
         GzYvx1r0kFmACHkhT6QNlxztlIl26YwQQwYZ4U/CuF/AAPeHAYhIzeGmdru7EfFaULfl
         ferg==
X-Gm-Message-State: AC+VfDx0TfzR5siIjNp9F+7wGix6EA1Bcj8CVeJrg92WdCJ0zzv+TpM0
        Ek+O0aWyLklqKzvPJwRFCnXDPKyhDV/d8k+PnxY=
X-Google-Smtp-Source: ACHHUZ5ygROrc1uE2iqbtxUOHvhqu65TqgC2pFoqunujnydLBoPYcqPLtGvyDiEKVyuIXyNAY+b6phUna94XeP6RZHU=
X-Received: by 2002:a17:902:ec87:b0:1ae:4567:2737 with SMTP id
 x7-20020a170902ec8700b001ae45672737mr328059plg.2.1686280660951; Thu, 08 Jun
 2023 20:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230602221604.155027-1-festevam@gmail.com> <20230602221604.155027-3-festevam@gmail.com>
 <6dba4123f60b14094d585dd011b1ee2d.sboyd@kernel.org>
In-Reply-To: <6dba4123f60b14094d585dd011b1ee2d.sboyd@kernel.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 9 Jun 2023 00:17:28 -0300
Message-ID: <CAOMZO5A0zzpxYn1eWrzitfLWCGrT_jaZcRw=DuN=Eu8knieUSA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: imx: imx6sx: Remove hardcoded LCDIF1 parent
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     shawnguo@kernel.org, hs@denx.de, abelvesa@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Thu, Jun 8, 2023 at 9:24=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wrot=
e:

> Do you need to check for the DT property and skip these clk_set_parent()
> calls if they're present? How does this work if the DT isn't updated at
> the same time?

Good point. I've just sent v2 with the DT property check as suggested.

Thanks
