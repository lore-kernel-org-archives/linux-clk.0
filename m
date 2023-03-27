Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFEFC76195
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 20:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjC0UT4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 16:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjC0UTt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 16:19:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52DAB0;
        Mon, 27 Mar 2023 13:19:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A767B81900;
        Mon, 27 Mar 2023 20:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29704C433D2;
        Mon, 27 Mar 2023 20:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679948386;
        bh=Rb/OVb00tSTRIoY3IEKzXuPEpEl/rfhpRv467XnkCR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YawCbHPl1IXOogf/m0ZtotzljB6PO5FjH51/srrovYkMXM4VCCwRPIFlhkNAbSZOT
         wvOMAO2EgUEeSLeBcEtGm7nIFG1SY0oIr1Ve5/UngsnFG1dsnmBdFv4E4H72QSi1+9
         G5lQxeu/kyGTL33jGCB2OAmPxK4shlXvw902ppT0/IVPXeacVsx27B2fY7gEnI2tjz
         2IqMJH5K4YDnBv1+G2/uhBXi/F0IHetwPJ9eCiplXutwhmAemJuos7dg99irVjHXLO
         0Wi3cpsX4Uq2WsV4Gtk/S1saXnZly2Foc8TKJMzp4dNPIk4Hv7tfsWUbGUIW44mQ5F
         R/mpSRynbYCSA==
Message-ID: <bb9779f93407bd1944186c395f5b1a11.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322171515.120353-2-noltari@gmail.com>
References: <20230322171515.120353-1-noltari@gmail.com> <20230322171515.120353-2-noltari@gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clk: add BCM63268 timer clock definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>,
        Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, william.zhang@broadcom.com,
        =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Date:   Mon, 27 Mar 2023 13:19:43 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting =C3=81lvaro Fern=C3=A1ndez Rojas (2023-03-22 10:15:12)
> Add missing timer clock definitions for BCM63268.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
