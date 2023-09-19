Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37677CD548A
	for <linux-clk@archiver.kernel.org>; Tue, 19 Sep 2023 07:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjISHiQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Sep 2023 03:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjISHiE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Sep 2023 03:38:04 -0400
X-Greylist: delayed 440 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 00:37:58 PDT
Received: from mail.leeswilly.pl (mail.leeswilly.pl [89.116.26.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D3A19D
        for <linux-clk@vger.kernel.org>; Tue, 19 Sep 2023 00:37:58 -0700 (PDT)
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
        id F41CE76134A; Tue, 19 Sep 2023 09:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
        t=1695108637; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
        h=Date:From:To:Subject:From;
        b=rlLRj4GQuuARDlv7wX5/AJ1LAf0hj9bY1rbBKH5ivfghxsBXmszkrfdSHydPjoEyI
         fYB2whcaE69XF8H3jXxFBDBHWNJ1tjnVL/2oEy5DPsrH0OF84BJU0aU+DohQWYECHL
         UX151p6WBIrUpPk0ues82PTl080m9KsYd+XLesiaOszanpTzHc4EqKJP+3KtCFGo/G
         hyeC9jPdty8JLFgl7uKq5kiNuDEEV4MutMXzIRZa4DerbfJNkxl0C9LW0B0vESovWP
         qrjQvl1A+RCQfwgcHG0dkbc0AcIBIZ1020NyTlqeTALgwFMLVTinpJm09XMy4J+VTs
         0N8G6bbM6yNMg==
Received: by mail.leeswilly.pl for <linux-clk@vger.kernel.org>; Tue, 19 Sep 2023 07:30:18 GMT
Message-ID: <20230919084500-0.1.3z.bbic.0.f9f490ntgq@leeswilly.pl>
Date:   Tue, 19 Sep 2023 07:30:18 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To:     <linux-clk@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Jakub Lemczak
