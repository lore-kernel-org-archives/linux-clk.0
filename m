Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BC4C43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B1692088F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556207072;
	bh=Jha0TyVbyEk0aIG76luGjR6VlfB95JHpvk6j8MMyFz4=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=wmWeWoW6vflVOdZSqmYRjuxaOUNmXt8KcKmMVyKY8e+UJ020VKjtMYn9oMBwmx7Xc
	 T2yGM0iOXmOpGdCtSAJmmpNBGBw5W8EM+HRDFnbOVdINZVl3/x06DzbuKfVQvenWPF
	 1xlSDOGuiVLKnv4ITMqOV4+C4Ncc5FWPH30uh2w0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfDYPob (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:44:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfDYPob (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 11:44:31 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ACFC206C1;
        Thu, 25 Apr 2019 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556207071;
        bh=Jha0TyVbyEk0aIG76luGjR6VlfB95JHpvk6j8MMyFz4=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=FBiZcqemGVdWTlSaznXH0m/6pky4usVN+4IlITZwoS+u/LbaQ6E2Op4hx2i/Xn+N+
         jn6WQgE6LkYpzoI0Tw8UijdMEjvjmgVnHoVkaTz5EF9EbDzrew7IF+6d5uC5YQe3+F
         VkEdOZAK2W2qe7cibX9cfRXojUzZFMC7bn9k7vZQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190422062314.1354-1-shawnguo@kernel.org>
References: <20190422062314.1354-1-shawnguo@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL 1/3] i.MX common clock changes for 5.2
To:     Shawn Guo <shawnguo@kernel.org>
Message-ID: <155620706990.15276.27062523051743240@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 08:44:29 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-04-21 23:23:12)
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.2
>=20
> for you to fetch changes up to 48a15bb42df85d30e13281642a12fd27221668fa:
>=20
>   clk: imx: Remove unused imx_get_clk_hw_fixed (2019-03-26 16:49:49 +0800)
>=20
> ----------------------------------------------------------------

Pulled into clk-next, but next time please merge your branches together
and send one pull request. Unless the code you're sending is for wildly
different imx clk drivers I expect to see one PR or one PR and a
followup PR later on.

