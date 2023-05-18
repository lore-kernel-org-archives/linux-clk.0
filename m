Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DF1C7EE22
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 10:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjERKoj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 06:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjERKoi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 06:44:38 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5E71997
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 03:44:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f4271185daso18077405e9.2
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684406672; x=1686998672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5YOoOny5GeU/yoy6ZnrO3UqlpG9WEFFDvc/Cyt8ALc=;
        b=bQ9t44ZnFKwwQIjbvj1thu8x1rvzqY6qHEPJ9uXbfkvVewILHj10pIhV4OQuYvIt0t
         gS/G2tNPcB65EqFMljpwqDUCqgQIfjwWiMj6LD9g/1NamT28LxPs26qdrlZUm2Q2aBDm
         pIYt2g7PuwWWEm67L9DRNiR6eXAQbAPDZzfoFX6G0fuBh0ZaNQ82scu5MjtLsvxty9b/
         iy3wKWOa5nqTGhXMR6dwy3MP3QdW4IqxukCpyn6pRm46sLzMKbbEPLmvqdUd4JfYPBqF
         bp4KcWyHSwRBa4ra1+VtdjdMlzBCLwUfscIJALXU1UoL468x9m+i94XbSOp/GAxq1kmm
         uDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684406672; x=1686998672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5YOoOny5GeU/yoy6ZnrO3UqlpG9WEFFDvc/Cyt8ALc=;
        b=icPVtTW+GyevTEx0sxtsuTnI2pu6JQm5GBwwVIcLIb+xTx6/D9FnVJzvQKun1ygpwU
         iYaQzCHRkMogdnyIT6l6tH+LBcUzyQPSgalBnJTEGa3Bvqr6H2oaY3+CrX4Ey6/mrYdt
         1f2f0GUuRtvkcQqzcc/D4XtIRgc3cXmP0rPe8dMBolLgVz2KhcM3dMTBnAYlyRXllCMa
         48LUVOwxJlcJO5Kzrdt6PnUNduSNXEh2IrLyEUPThsViw+nr4j8QFThMBhs6QOiQ4S9c
         oJUVIoCZORnaXoQzeA00ehWzqiPjRRzoO+D8kNY8JJ9nYJEwiWhTc6defRqnwpLGuutx
         mKnw==
X-Gm-Message-State: AC+VfDyJ4RiZpC5tkFcZw5t0Mo3CnHwwZO4CJgtr0GoLK9i1isHNKhtK
        eJMY/TFaZ1h7LN3HaeOzpshj9g==
X-Google-Smtp-Source: ACHHUZ6L4KxQV1U/bo0lhR1+O26ulUGU6q42UC5dn9d+3sL5GB2oetMnb7wm33ux9GOm2q+8QV/xUA==
X-Received: by 2002:a1c:f616:0:b0:3f0:9564:f4f6 with SMTP id w22-20020a1cf616000000b003f09564f4f6mr1198292wmc.1.1684406672144;
        Thu, 18 May 2023 03:44:32 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d4ec2000000b0030647d1f34bsm1798526wrv.1.2023.05.18.03.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 03:44:31 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] clk: imx6ul: retain early UART clocks during kernel init
Date:   Thu, 18 May 2023 13:43:32 +0300
Message-Id: <168440637274.2550608.8698925821943106250.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421115517.1940990-1-alexander.stein@ew.tq-group.com>
References: <20230421115517.1940990-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri, 21 Apr 2023 13:55:17 +0200, Alexander Stein wrote:
> Make sure to keep UART clocks enabled during kernel init if
> earlyprintk or earlycon are active.
> 
> 

Applied, thanks!

[1/1] clk: imx6ul: retain early UART clocks during kernel init
      commit: 912d7af473f163ccdeb02aaabc3534177936b86c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
