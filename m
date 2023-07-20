Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945C4EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 09:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjGTJap (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjGTJaY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 05:30:24 -0400
Received: from out-62.mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3E42D4D
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 02:19:53 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689844790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aY5ZIHVzqKStKyl3k69PdYOrRbB8zSK0DaCbVQ7/OGA=;
        b=fgIJIFH/Cnyi8aVF1Q+r8C7Thp478NsKaKk1wRZboWWj6Yxu5jcjjRloE1Vf+YkMk9TYRF
        Vjry3TSPqhOlqODz00DJuvPXPlTSrN4jWkmXqNriwp8wp8wRDFoSIzG2qlx4ADDe1pA4fW
        0vs7WMo0+27zCZxIXo9ZCp6oCIt/rnI=
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
To:     Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH net-next 01/11] tools: ynl-gen: fix enum index in _decode_enum(..)
Date:   Thu, 20 Jul 2023 10:18:53 +0100
Message-Id: <20230720091903.297066-2-vadim.fedorenko@linux.dev>
In-Reply-To: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Remove wrong index adjustement, which is leftover from adding
support for sparse enums.
enum.entries_by_val() function shall not subtract the start-value, as
it is indexed with real enum value.

Fixes: c311aaa74ca1 ("tools: ynl: fix enum-as-flags in the generic CLI")
Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 tools/net/ynl/lib/ynl.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 1b3a36fbb1c3..3908438d3716 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -420,16 +420,14 @@ class YnlFamily(SpecFamily):
     def _decode_enum(self, rsp, attr_spec):
         raw = rsp[attr_spec['name']]
         enum = self.consts[attr_spec['enum']]
-        i = attr_spec.get('value-start', 0)
         if 'enum-as-flags' in attr_spec and attr_spec['enum-as-flags']:
             value = set()
             while raw:
                 if raw & 1:
-                    value.add(enum.entries_by_val[i].name)
+                    value.add(enum.entries_by_val[raw & 1].name)
                 raw >>= 1
-                i += 1
         else:
-            value = enum.entries_by_val[raw - i].name
+            value = enum.entries_by_val[raw].name
         rsp[attr_spec['name']] = value
 
     def _decode_binary(self, attr, attr_spec):
-- 
2.27.0

