Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B7CEB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 09:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjGTJaq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjGTJaZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 05:30:25 -0400
Received: from out-42.mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3302D63
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 02:19:56 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689844793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=88kD5LtGsu72krDSvuVaSo3kF0C+fD95s9a3Fdq47T8=;
        b=CkV6aDCX1vs7CfvgV8GzR/yD1WAA+EewD5luSSNkHC1jUhQ27Ogvnp5nc+s3HLEGRK3HPG
        ILEDG9EkmZx5R49ZH7LQjtez2p1DxnwngDuSRh/hgUukVN610xQDyV790ByGHT8+IQ+Fj5
        7aNo2g2SrsecEohx2xh1CG5F+xKtswA=
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
Subject: [PATCH net-next 02/11] tools: ynl-gen: fix parse multi-attr enum attribute
Date:   Thu, 20 Jul 2023 10:18:54 +0100
Message-Id: <20230720091903.297066-3-vadim.fedorenko@linux.dev>
In-Reply-To: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

When attribute is enum type and marked as multi-attr, the netlink
respond is not parsed, fails with stack trace:
Traceback (most recent call last):
  File "/net-next/tools/net/ynl/./test.py", line 520, in <module>
    main()
  File "/net-next/tools/net/ynl/./test.py", line 488, in main
    dplls=dplls_get(282574471561216)
  File "/net-next/tools/net/ynl/./test.py", line 48, in dplls_get
    reply=act(args)
  File "/net-next/tools/net/ynl/./test.py", line 41, in act
    reply = ynl.dump(args.dump, attrs)
  File "/net-next/tools/net/ynl/lib/ynl.py", line 598, in dump
    return self._op(method, vals, dump=True)
  File "/net-next/tools/net/ynl/lib/ynl.py", line 584, in _op
    rsp_msg = self._decode(gm.raw_attrs, op.attr_set.name)
  File "/net-next/tools/net/ynl/lib/ynl.py", line 451, in _decode
    self._decode_enum(rsp, attr_spec)
  File "/net-next/tools/net/ynl/lib/ynl.py", line 408, in _decode_enum
    value = enum.entries_by_val[raw].name
TypeError: unhashable type: 'list'
error: 1

Redesign _decode_enum(..) to take a enum int value and translate
it to either a bitmask or enum name as expected.

Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 tools/net/ynl/lib/ynl.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 3908438d3716..06d88f083f95 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -417,8 +417,7 @@ class YnlFamily(SpecFamily):
         pad = b'\x00' * ((4 - len(attr_payload) % 4) % 4)
         return struct.pack('HH', len(attr_payload) + 4, nl_type) + attr_payload + pad
 
-    def _decode_enum(self, rsp, attr_spec):
-        raw = rsp[attr_spec['name']]
+    def _decode_enum(self, raw, attr_spec):
         enum = self.consts[attr_spec['enum']]
         if 'enum-as-flags' in attr_spec and attr_spec['enum-as-flags']:
             value = set()
@@ -428,7 +427,7 @@ class YnlFamily(SpecFamily):
                 raw >>= 1
         else:
             value = enum.entries_by_val[raw].name
-        rsp[attr_spec['name']] = value
+        return value
 
     def _decode_binary(self, attr, attr_spec):
         if attr_spec.struct_name:
@@ -436,7 +435,7 @@ class YnlFamily(SpecFamily):
             decoded = attr.as_struct(members)
             for m in members:
                 if m.enum:
-                    self._decode_enum(decoded, m)
+                    decoded[m] = self._decode_enum(decoded[m], m)
         elif attr_spec.sub_type:
             decoded = attr.as_c_array(attr_spec.sub_type)
         else:
@@ -464,6 +463,9 @@ class YnlFamily(SpecFamily):
             else:
                 raise Exception(f'Unknown {attr_spec["type"]} with name {attr_spec["name"]}')
 
+            if 'enum' in attr_spec:
+                decoded = self._decode_enum(int.from_bytes(attr.raw, "big"), attr_spec)
+
             if not attr_spec.is_multi:
                 rsp[attr_spec['name']] = decoded
             elif attr_spec.name in rsp:
@@ -471,8 +473,6 @@ class YnlFamily(SpecFamily):
             else:
                 rsp[attr_spec.name] = [decoded]
 
-            if 'enum' in attr_spec:
-                self._decode_enum(rsp, attr_spec)
         return rsp
 
     def _decode_extack_path(self, attrs, attr_set, offset, target):
-- 
2.27.0

