Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15A3C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 21:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiJQVLy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 17:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiJQVLy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 17:11:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDD579EDD;
        Mon, 17 Oct 2022 14:11:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CA921B81637;
        Mon, 17 Oct 2022 21:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D582C433C1;
        Mon, 17 Oct 2022 21:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666041110;
        bh=5QMPQQ+KG9KYuDrhq0EfboO1Zw1W09A12Csb9UbprxA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=usN+PqecDTe5B+HCCruj4ikjV+jVk8S+/HYyoLZze8zNToz//f/KXavo8t5LtsC+v
         iaGLgHQ3DwdMYgqnJpStOUR5q/32V1SC26GNYZCnmKCtQMDDYiKSUtv6zwCag9yS69
         Snj649OocEOW5RNEqnVb4/jiJsR40va7KeGqMpweaEeoMYAbHxW9IUrEuw92MVny/o
         mlJ4lYrQqDlDvQG1FXAmXQtRHGCFCQbPVmhzABcRlgDg3M4nsnKjnbaKLgZLtJ+fv3
         8MbqJwbILENn4hAoUy3+TGBS2WlFnXuHlCQNmb4XesmzpDLt+FGHHkDeZQClV0HVjB
         xf9iLCHJ5+BpA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220913031756.983224-2-yangyingliang@huawei.com>
References: <20220913031756.983224-1-yangyingliang@huawei.com> <20220913031756.983224-2-yangyingliang@huawei.com>
Subject: Re: [PATCH -next 2/2] clk: qcom: clk-spmi-pmic-div: Use dev_err_probe() helper
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, andersson@kernel.org
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 17 Oct 2022 14:11:48 -0700
User-Agent: alot/0.10
Message-Id: <20221017211150.8D582C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Yingliang (2022-09-12 20:17:56)
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
